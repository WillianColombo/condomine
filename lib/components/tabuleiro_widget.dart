import 'package:condomine/components/campo_widget.dart';
import 'package:condomine/models/campo.dart';
import 'package:condomine/models/dificuldade.dart';
import 'package:flutter/material.dart';
import 'package:condomine/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  Tabuleiro tabuleiro;
  final void Function(Campo)
      onAbrir; //Callback da função abrir, acionado pelo onTap do botão
  final void Function(Campo)
      onAlternarFlag; //Callback da função alternar Flag, acionado pelo longPress do botão

  TabuleiroWidget({
    //Construtor
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlternarFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c) {
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
