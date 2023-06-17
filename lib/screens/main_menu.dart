import 'package:campominado/screens/game.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 147, 128),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("CONDOMINE",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 109, 54, 35),
                    
                  ),
                ),
                margin: const EdgeInsets.all(50.0),
              ),
              Container(
                width: 500, 
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Game())),
                  child: const Text("Jogar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return Color.fromARGB(255, 109, 54, 35);})
                  ),
                ),
              ), 
              Container(
                width: 500, 
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => showMenu(

                    context: context, 
                    position: RelativeRect.fromLTRB(0, 600, 0, 0), 
                    items: [
                      const PopupMenuItem<String>(
                        value: 'opcao1',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Fácil'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'opcao2',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Médio'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'opcao3',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Difícil'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  child: const Text("Dificuldade"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return Color.fromARGB(255, 109, 54, 35);})
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}