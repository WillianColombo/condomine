import 'package:campominado/components/resultado_widget.dart';
import 'package:campominado/components/tabuleiro_widget.dart';
import 'package:campominado/models/campo.dart';
import 'package:campominado/models/explosao_exception.dart';
import 'package:campominado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int _venceu = 0; // 0 = start | 1 = vitória | 2 = derrota
  Tabuleiro _tabuleiro = Tabuleiro(colunas: 0,linhas: 0, qtdBombas: 0);

  @override
  void initState() {
    super.initState();
    _tabuleiro = _getTabuleiro(1980, 1020);
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

  Tabuleiro _getTabuleiro(double largura, double altura) {
      int qtdeColunas = 30;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdeLinhas,
        colunas: qtdeColunas,
        qtdBombas: 100,
      );
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: () => _reiniciar,
        ),
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