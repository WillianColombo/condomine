import 'package:campominado/models/campo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CampoWidget extends StatelessWidget {
  //const CampoWidget({super.key});

  Campo campo = Campo(1, 2);
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarFlag;

  CampoWidget({super.key, 
    required this.campo,
    required this.onAbrir,
    required this.onAlternarFlag,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),    
      onPressed: () => onAbrir(campo),
      onLongPress: () => onAlternarFlag(campo),
      child: Text("$num")
    );
  }
}