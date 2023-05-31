import 'dart:math';
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
    final int _qtdBombas = 0; //Inicializa a variável que conterá a quantidade de bombas

    List<Campo> tabuleiro = []; // Lista para armazenar os campos

    int i = 0; // Contador referente as linhas
    int j = -1; //Contador referente as coluanas

    @override
  void initState() {
    qtdBombasTab();
    super.initState();
  }

    int qtdBombasTab(){
      int qtd = (_colunas * _linhas) * 0.2.floor();
      return qtd;
    }

    bool sortearMinas(){
      int sorteadas = 0;
    
      while(sorteadas < _qtdBombas) {
        int i = Random().nextInt(tabuleiro.length);

        if(!tabuleiro[i].minado) {
          sorteadas++;
          tabuleiro[i].minar();
        }
      }
      return true;
    }

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
        Campo campo = Campo(j, i);
        tabuleiro.add(campo);
        
        return  campo; //Retorna a coordenada do campo na matriz
      },
    ),
  );
    }
  }