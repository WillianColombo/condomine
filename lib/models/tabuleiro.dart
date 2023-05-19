import 'package:campominado/models/campo.dart';
import 'package:flutter/material.dart';

  class Tabuleiro extends StatelessWidget {
    //const Tabuleiro({super.key});

    final int _linhas = 20; //Define o número de linhas para o tabuleiro
    final int _colunas = 20; //Define o número de colunas para o tabuleiro
  
    @override
    Widget build(BuildContext context) {
  return Container(
    color: Colors.grey[200],
    padding: const EdgeInsets.all(16.0),
    child: GridView.count(
      crossAxisCount: _colunas,
      children: <Widget>[
        for (var i = 0; i < _linhas; i++) 
          for (var j = 0; j < _colunas; j++)
            ElevatedButton(
              onPressed: () {
                print("Abrir");
              },
              child: const Text('Botão'),
            ),
      ],
    ),
  );
}
  }