import 'package:campominado/components/campo_widget.dart';
import 'package:campominado/models/campo.dart';
import 'package:flutter/material.dart';
import 'package:campominado/models/tabuleiro.dart';

// ignore: must_be_immutable
class TabuleiroWidget extends StatelessWidget {
  //const TabuleiroWidget({super.key});

  Tabuleiro tabuleiro = Tabuleiro(
    colunas: 0,
    linhas: 0,
    qtdBombas: 0
  );
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarFlag;

  TabuleiroWidget({super.key, 
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlternarFlag,
  });

  @override
    Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size; //Recebe a proporção de tela do dispositivo
      
      return Container(
    height: screenSize.height, //Define a altura do container
    width: screenSize.width*0.8, //Define a largura do container
    //color: Color.fromARGB(255, 255, 255, 255),
    padding: const EdgeInsets.all(45.0),
    child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.tabuleiro.map((c) {
          return CampoWidget(
            campo: c,
            onAbrir: onAbrir,
            onAlternarFlag: onAlternarFlag,
          );
        }).toList(),
      ),
    );
  }
}