import 'package:campominado/models/campo.dart';
import 'package:flutter/material.dart';

  class Tabuleiro extends StatelessWidget {
    Tabuleiro({super.key});

    //final int _linhas = 20; //Define o número de linhas para o tabuleiro
    final int _colunas = 20; //Define o número de colunas para o tabuleiro
    int columnCount = 0;
  
    @override
    Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

      double proporcao = screenSize.width*0.8/screenSize.height;
      print(proporcao);
      print("Altura: ${screenSize.height}");
      print("Largura: ${screenSize.width*0.8}");

  return Container(
    height: screenSize.height,
    width: screenSize.width*0.8,
    color: Colors.grey[200],
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
      shrinkWrap: true,
     // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _colunas,
      ),
      itemBuilder: (context, position) {
        return Campo();
      },
    ),
  );
    }
  }