import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:condomine/main.dart';
import 'package:condomine/models/campo.dart';

//Classe lógica o tabuleiro

class Tabuleiro {
  int linhas; //Qtd de linhas do tabuleiro
  int colunas; //Qtd de colunas do tabuleiro
  int qtdBombas; //Qtd de bombas do tabuleiro

  Tabuleiro({//Construtor
    required this.linhas,
    required this.colunas,
    required this.qtdBombas,
  }) {
    //Chamada dos métodos necessários para inicializar
    gerarTabuleiro();
    _relacionarVizinhos();
    _sortearMinas();
  }

  final List<Campo> _campos = []; // Lista para armazenar os campos

  void gerarTabuleiro() {
//Método que cria os dados em memória do tabuleiro. Ou seja, adiciona os campos na matriz
    for (int linha = 0; linha < linhas; linha++) {
      for (int coluna = 0; coluna < colunas; coluna++) {
        Campo campo = Campo(coluna, linha);
        _campos.add(campo);
      }
    }
  }

  void reiniciar() {
    //Método que será utilizado para reiniciar o game
    _campos.forEach((c) => c.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    //Quando o jogo for perdido, revela todos os campos incluindo bombas
    _campos.forEach((c) => c.revelarBomba());
    player.play(DeviceFileSource('assets/sons/explosao.mp3'));
    player.setVolume(0.5);
  }

  void _relacionarVizinhos() {
    //Relaciona os campos com seus vizinhos adjacentes
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    //Sorteia as bombas aleatóriamente, com base na variável qtdBombas
    int sorteadas = 0;

    if (qtdBombas > linhas * colunas) {
      return;
    }
    while (sorteadas < qtdBombas) {
      int i = Random().nextInt(_campos.length);

      if (!_campos[i].minado) {
        sorteadas++;
        _campos[i].minar();
      }
    }
  }

  List<Campo> get campos {
    //Get da lista de campos, ou seja, o tabuleiro em sí
    return _campos;
  }

  bool get resolvido {
    //Get que retorna se todos os campos do tabuleiros foram resolvidos
    return _campos.every((c) => c.resolvido);
  }
}
