import 'package:flutter/material.dart';

//Classe que adiciona um widget AlertDialog, para mostrar uma mensagem de vitória

class VencerWidget extends StatelessWidget {
  const VencerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Parabéns!'),
          content: const Text('Você conseguiu resolver o tabuleiro!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
  }
}