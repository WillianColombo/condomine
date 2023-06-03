import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  int venceu = 0; // 0 = start | 1 = vitória | 2 = derrota
  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar

  ResultadoWidget({ //Construtor
    required this.venceu,
    required this.onReiniciar,
  });

  Color _getCor() { //Retorna a cor que o icon do resultado/reiniciar deve ter
    if (venceu == 0) {
      return Colors.yellow;
    } else if (venceu == 1) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  IconData _getIcon() { //Retorna o icon que o botão do resultado/reiniciar deve ter
    if (venceu == 0) {
      return Icons.sentiment_satisfied;
    } else if (venceu == 1) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onReiniciar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}