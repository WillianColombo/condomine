import 'package:flutter/material.dart';
import 'package:campominado/models/tabuleiro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira o rótulo "debug" da AppBar
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text('CONDOMINE'),
        ),
        body: const Tabuleiro(), // Vincula o tabuleiro a tela
      ),
    );
  }
}