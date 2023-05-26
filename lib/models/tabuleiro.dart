import 'package:campominado/models/campo.dart';
import 'package:flutter/material.dart';

  class Tabuleiro extends StatefulWidget {
    const Tabuleiro({super.key});
  
    @override
    State<Tabuleiro> createState() => _TabuleiroState();
  }
  
  class _TabuleiroState extends State<Tabuleiro> {
    final int _linhas = 17; //Define o número de linhas para o tabuleiro
    final int _colunas = 30; //Define o número de colunas para o tabuleiro

    int i = 0;
    int j = -1;

    @override
    Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size; //Recebe a proporção de tela do dispositivo
      
      return Container(
    height: screenSize.height, //Define a altura do container
    width: screenSize.width*0.8, //Define a largura do container
    //color: Color.fromARGB(255, 255, 255, 255),
    padding: const EdgeInsets.all(45.0),
    child: GridView.builder(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(), //Impede a utilização do scroll
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _colunas, //Define o número de colunas do GridView com base no _colunas
      ),
      itemCount: _linhas * _colunas, //Define o número de campos
      itemBuilder: (context, position) {
        j++;
        if (j == _colunas) {
          i++;
          j = 0;
        }

        return  Campo(i, j);
      },
    ),
  );
    }
  }