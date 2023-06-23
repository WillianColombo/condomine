import 'package:condomine/components/app_bar.dart';
import 'package:condomine/components/tabuleiro_widget.dart';
import 'package:condomine/models/campo.dart';
import 'package:condomine/models/dificuldade.dart';
import 'package:condomine/models/explosao_exception.dart';
import 'package:condomine/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  String nivel;

  Game({required this.nivel});
  @override
  _GameState createState() => _GameState(nivel: nivel);
}

class _GameState extends State<Game> {
  int _venceu = 0; // 0 = start | 1 = vitória | 2 = derrota
  Tabuleiro _tabuleiro = Tabuleiro(colunas: 0, linhas: 0, qtdBombas: 0);
  String nivel;
  Dificuldade dificuldade = Dificuldade(0, 0, 0);

  _GameState({required this.nivel});

  @override
  void initState() {
    super.initState();
    getDificuldade();
    _tabuleiro = _getTabuleiro(1920, 1080);
    _reiniciar();
  }

  void _reiniciar() {
    setState(() {
      _venceu = 0;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != 0) {
      return;
    }

    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = 1;
        }
      } on ExplosaoException {
        _venceu = 2;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarFlag(Campo campo) {
    if (_venceu != 0) {
      return;
    }

    setState(() {
      campo.alternarFlag();
      if (_tabuleiro.resolvido) {
        _venceu = 1;
      }
    });
  }

  Dificuldade getDificuldade() {
    if (nivel == "Fácil") {
      dificuldade.colunas = 29;
      dificuldade.menosLinhas = 2;
      dificuldade.qtdBombas = 0.15;
    } else if (nivel == "Médio") {
      dificuldade.colunas = 40;
      dificuldade.menosLinhas = 3;
      dificuldade.qtdBombas = 0.2;
    } else {
      dificuldade.colunas = 50;
      dificuldade.menosLinhas = 4;
      dificuldade.qtdBombas = 0.3;
    }
    return dificuldade;
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    int qtdeColunas = dificuldade.colunas;
    double tamanhoCampo = largura / qtdeColunas;
    int qtdeLinhas =
        ((altura / tamanhoCampo) - dificuldade.menosLinhas).floor();

    int qtdBombaCalc =
        ((qtdeLinhas * qtdeColunas) * dificuldade.qtdBombas).floor();
    //Cria dinamicamente a quantidade de bombas, neste caso, 20% do total de campos

    _tabuleiro = Tabuleiro(
      linhas: qtdeLinhas,
      colunas: qtdeColunas,
      qtdBombas: qtdBombaCalc,
    );
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(onReiniciar: () => _reiniciar, venceu: _venceu),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _tabuleiro,
                onAbrir: _abrir,
                onAlternarFlag: _alternarFlag,
              );
            },
          ),
        ),
      ),
    );
  }
}
