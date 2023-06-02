import 'package:campominado/models/campo.dart';

class Tabuleiro {
  int linhas;// = 17; //Define o número de linhas para o tabuleiro
  int colunas;// = 30; //Define o número de colunas para o tabuleiro
  int qtdBombas;// = 0; //Inicializa a variável que conterá a quantidade de bombas

  Tabuleiro({
    required this.linhas,
    required this.colunas,
    required this.qtdBombas,
  });

  List<Campo> tabuleiro = []; // Lista para armazenar os campos

  int i = 0; // Contador referente as linhas
  int j = -1; //Contador referente as colunas

    int qtdBombasTab(){ //Define a quantidade de bombas. Adiciona 20% dos campos totais do tabuleiro
      int qtd = (colunas * linhas) * 0.2.floor();
      return qtd;
    }

    void gerarTabuleiro(){
      for (int linha = 0; linha < linhas; linha++) {
        for (int coluna = 0; coluna < colunas; coluna++) {
          Campo campo = Campo(coluna, linha);
          tabuleiro.add(campo);
        }
      }
    }

/*
    bool sortearMinas(){
      int sorteadas = 0;
    
      while(sorteadas < _qtdBombas) {
        int i = Random().nextInt(tabuleiro.length);

        if(!tabuleiro[i].minado) {
          sorteadas++;
          tabuleiro[i].minar();
        }
      }
      return true;
    }*/

     List<Campo> get getTabuleiro => tabuleiro;
  }