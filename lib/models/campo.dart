import 'package:flutter/material.dart';

class Campo extends StatefulWidget {
  //Campo({super.key});

    int? _numColuna;
    int? _numLinha;

  Campo(this._numColuna, this._numLinha, {super.key});

  @override
  State<Campo> createState() => _CampoState();
}

class _CampoState extends State<Campo> {
  bool _minado = false;
  bool _aberto = false;
  int qtdBombasAdj = 0;

  void _abrir(){
    print("Abrir");
    _aberto = true;

    if(_aberto = true) {
      Text("1");
      print("Mudar");
    }
    
    
  }

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
      onPressed: _abrir, 
      child: const Text("0")
    );
  }
}
