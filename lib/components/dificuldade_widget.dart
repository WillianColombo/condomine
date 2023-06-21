import 'package:flutter/material.dart';

class DificuldadeWidget extends StatefulWidget {
  const DificuldadeWidget({super.key});

  @override
  State<DificuldadeWidget> createState() => _DificuldadeWidgetState();
}

class _DificuldadeWidgetState extends State<DificuldadeWidget> {
  String dificuldade = "Médio";

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 500, 
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => showMenu(
                    context: context, 
                    position: const RelativeRect.fromLTRB(0, 600, 0, 0), 
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
                          dificuldade = "Fácil";
                        });
                      } else if (value == 'medio') {
                        setState(() {
                          dificuldade = "Médio";
                        });
                      } else if (value == 'dificil') {
                        setState(() {
                          dificuldade = "Difícil";
                        });
                      }
                    }
                  }),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) { return const Color.fromARGB(255, 109, 54, 35);})
                  ),
                  child: Text("Dificuldade: $dificuldade"),
                ),
    );
  }
}