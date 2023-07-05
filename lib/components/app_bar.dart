import 'dart:async';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


//Classe que implementa a AppBar do aplicativo

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar
  int resultado = 0; // 0 = start | 1 = vitória | 2 = derrota

  MyAppBar({ //Construtor da classe
      required this.resultado,
      required this.onReiniciar});

  @override //Propriedade para utilizar a AppBar, implementada pelo PreferredSizeWidget
  Size get preferredSize => const Size.fromHeight(55);

  @override
  State<MyAppBar> createState() =>
      _MyAppBarState(onReiniciar: onReiniciar, resultado: resultado);
      
}

///////////////////////////////////////////////////////////////////////////////////

class _MyAppBarState extends State<MyAppBar> {
  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar
  int resultado = 0; // 0 = start | 1 = vitória | 2 = derrota
  
  //Variáveis utilizadas para o temporizador
  /*Timer? timer; //Variável utilizada no temporizador
  int _tempo = 0;*/

  _MyAppBarState(
      { //Construtor do state
      required this.resultado,
      required this.onReiniciar});

  //Inicializa o temporizador
  /*@override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (resultado == 0) {
          _tempo++;
        } else {
          timer!.cancel();
        }
      });
    });
  }*/

  //Método que zera o tempo
  /*void zerarTempo() {
    setState(() {
      _tempo = 0;
    });
  }*/

  /*@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 147, 128),
        leading: ElevatedButton(
          //Botão para voltar a tela inicial
          onPressed:() => Navigator.of(context, rootNavigator: true).pop(), 
          style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith<Color?>((states) {
            return const Color.fromARGB(255, 109, 54, 35);
            
          })),
          child: const Icon(Icons.home),
        ),
        actions: [
          
          /*Text(
            //Temporizador
            _tempo.toString(),
            style: const TextStyle(fontSize: 24),
          ),*/
          ElevatedButton(
            //Botão para reiniciar
            onPressed: onReiniciar(),
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              return const Color.fromARGB(255, 109, 54, 35);
            })),
            child: const Icon(Icons.refresh),
          )
        ]);
  }
}
