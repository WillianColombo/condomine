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
  bool minado = false;
  bool _aberto = false;
  bool _flag = false;
  int qtdBombasAdj = 0;
  int num = 0;

  void minar(){
    minado = true;
  }

  void _abrir(){ //Método que abre os campos
    if(_flag == false){ //Proteção contra miss click
      if(minado == false && _aberto == false){
        _aberto = true;
        setState(() {
          num = 1;
        });
        print("${widget._numLinha}/${widget._numColuna}"); //Mostrando as coordenadas, apagar depois
      } else if(minado == true){
        setState(() {
          num = 9;
        });
      }
    }
  }

  void _alternarFlag(){
    if(_aberto == false){
      _flag =! _flag;
      setState(() {
        if(_flag == true){
          num = 8;
        } else {
          num = 0;
        }
      });
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
      onLongPress: _alternarFlag,
      child: Text("$num")
    );
  }
}
