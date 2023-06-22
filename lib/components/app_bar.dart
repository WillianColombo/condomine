import 'package:campominado/screens/main_menu.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  //const MyAppBar({super.key});

  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar

  MyAppBar({
    required this.onReiniciar
  });

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  State<MyAppBar> createState() => _MyAppBarState(onReiniciar: onReiniciar);
}

class _MyAppBarState extends State<MyAppBar> {

  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar

  _MyAppBarState({
    required this.onReiniciar
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 199, 147, 128),
      leading: ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainMenu())),
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
                  ),
                  child: const Icon(Icons.home),
            ),
      actions: [
            ElevatedButton(
              onPressed: onReiniciar(),
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
              ),
              child: const Icon(Icons.refresh),
            )]
    );
  }
}