import 'package:flutter/material.dart';
import 'package:campominado/models/tabuleiro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grade de Botões'),
        ),
        body: Tabuleiro(), // Utiliza o novo widget personalizado
      ),
    );
  }
}