import 'package:campominado/screens/main_menu.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget  {
  //const MyAppBar({super.key});

  final Function onReiniciar; //Método para reiniciar o game, sendo acessado pelo icon na AppBar

  MyAppBar({
    required this.onReiniciar
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 199, 147, 128),
      leading: ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainMenu())),
              child: const Text("Menu Iniciar"),
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
                  ),
            ),
            leadingWidth: 75,
      actions: [
            ElevatedButton(
              onPressed: onReiniciar(), 
              child: const Icon(Icons.refresh),
              style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
              )
            )]
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}