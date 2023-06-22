import 'package:campominado/screens/game.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override

  String _dificuldade = "Médio";

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
                margin: const EdgeInsets.all(50.0),
                child: const Text("CONDOMINE",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color:Color.fromARGB(255, 109, 54, 35),
                  ),
                ),
              ),
              Container(
                width: 500, 
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Game(nivel: _dificuldade,))),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return Color.fromARGB(255, 109, 54, 35);}),
                  ),
                  child: const Text("Jogar", 
                  style: TextStyle(
                    fontSize: 30.0,),),
                  
                ),
              ), 
              Container(
                decoration: BoxDecoration(color: Colors.amber),
                width: 500, 
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => showMenu(
                    context: context, 
                    position: const RelativeRect.fromLTRB(700, 550, 700, 0), 
                    items: [
                      const PopupMenuItem<String>(
                        value: 'facil',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Fácil'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'medio',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Médio'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'dificil',
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 10),
                            Text('Difícil'),
                          ],
                        ),
                      ),
                    ],
                    elevation: 8.0,
                  ).then((value) {
                    if (value != null) {
                      if (value == 'facil') {
                        setState(() {
                          _dificuldade = "Fácil";
                        });
                      } else if (value == 'medio') {
                        setState(() {
                          _dificuldade = "Médio";
                        });
                      } else if (value == 'dificil') {
                        setState(() {
                          _dificuldade = "Difícil";
                        });
                      }
                    }
                  }),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
                  ),
                  child: Text("Dificuldade: $_dificuldade",
                  style: const TextStyle(
                    fontSize: 30.0,),
                  ),
                ),
    ),
            ],
          ),
        ),
      ),
    );
  }
}