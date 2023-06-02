import 'package:campominado/components/tabuleiro_widget.dart';
import 'package:campominado/models/campo.dart';
import 'package:campominado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  int _resultado = 0; // 0 = start | 1 = vitória | 2 = derrota
  Tabuleiro _tabuleiro = Tabuleiro (
    colunas: 0,
    linhas: 0,
    qtdBombas: 0
  );

  void _abrir(Campo campo) {
    if (_resultado != 0) {
      return;
    }
    setState(() {
      if(campo.getMinado == false) {
        campo.abrir();
      } else {
        _resultado = 2;
      }
    });
  }
  
  void _alternarFlag(Campo campo) {
    if (_resultado != 0) {
      return;
    }
    setState(() {
      campo.alternarFlag();
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdeLinhas,
        colunas: qtdeColunas,
        qtdBombas: 50,
      );
    return _tabuleiro;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira o rótulo "debug" da AppBar
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text('CONDOMINE'),
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
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