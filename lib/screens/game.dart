import 'package:condomine/components/app_bar.dart';
import 'package:condomine/components/tabuleiro_widget.dart';
import 'package:condomine/models/campo.dart';
import 'package:condomine/models/dificuldade.dart';
import 'package:condomine/models/explosao_exception.dart';
import 'package:condomine/models/tabuleiro.dart';
import 'package:flutter/material.dart';

//Classe do jogo, na qual conecta todos os elementos 

class Game extends StatefulWidget {
  List<bool>? nivel; //Escolha da dificuldade feita na tela inicial

  Game({required this.nivel});
  @override
  _GameState createState() => _GameState(nivel: nivel);
}

class _GameState extends State<Game> {
  int _venceu = 0; // 0 = start | 1 = vitória | 2 = derrota
  Tabuleiro _tabuleiro = Tabuleiro(colunas: 0, linhas: 0, qtdBombas: 0); //Inicializa o tabuleiro zerado
  List<bool>? nivel; //Escolha da dificuldade feita na tela inicial
  Dificuldade _dificuldade = Dificuldade(0, 0, 0); //Inicializa a dificuldade zerada

  _GameState({required this.nivel});//Requer a variável nível

  //InitState
  @override
  void initState() {
    super.initState();
    _getDificuldade();
    _tabuleiro = _getTabuleiro(1920, 1080);
    _reiniciar();
  }

  //Método chamado a partir do botão da AppBar. Aciona o método reiniciar da classe Tabuleiro
  void _reiniciar() {
    setState(() {
      _venceu = 0;
      _tabuleiro.reiniciar();
    });
  }

  //Método que abre os campos a partir do onTap
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

  //Método que adiciona uma bandeira no campo, acionado a partir do longPress
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

  //Método que retorna os valores para a dificuldade, na qual foi escolhida previamente na tela inicial
  Dificuldade? _getDificuldade(){
    for(int i = 0; i < nivel!.length; i++) {
      if(nivel![i] == false){
      } else{
        if(i == 0){
          _dificuldade.colunas = 29;
          _dificuldade.menosLinhas = 2;
          _dificuldade.qtdBombas = 0.15; 
        } else if(i == 1){
          _dificuldade.colunas = 40;
          _dificuldade.menosLinhas = 3;
          _dificuldade.qtdBombas = 0.2;
        } else {
          _dificuldade.colunas = 50;
          _dificuldade.menosLinhas = 4;
          _dificuldade.qtdBombas = 0.3;
        }
      return _dificuldade;
      }
    }
  }

  //Método que gera o tabuleiro lógico a ser utilizado
  Tabuleiro _getTabuleiro(double largura, double altura) {
    //Quantidade de colunas absoluta definida pela dificuldade
    int qtdeColunas = _dificuldade.colunas;

    //Calcula o tamanho do campo a partir da largura da tela e quantidade de colunas
    double tamanhoCampo = largura / qtdeColunas;

    //Calcula a quantidade de linhas a partir da altura da tela e tamanho do campo. Subtrai a quantidade necessária para que fique certo na tela
    int qtdeLinhas = ((altura / tamanhoCampo) - _dificuldade.menosLinhas).floor();

    //Cria dinamicamente a quantidade de bombas, neste caso, 20% do total de campos
    int qtdBombaCalc = ((qtdeLinhas * qtdeColunas) * _dificuldade.qtdBombas).floor();

    //Insere ao objeto zerado, os valores a serem utilizados
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
        appBar: MyAppBar(onReiniciar: () => _reiniciar, venceu: _venceu), //Chama a classe app_bar.dart
        body: Container( //Container que agrega o GridView da clase TabuleiroWidget
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
