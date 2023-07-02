// A classe dificuldade facilita a definição das propriedades do tabuleiro definidas dentro do game.dart

class Dificuldade {
  int _colunas = 0; //Quantidade absoluta de colunas que será gerado
  int _menosLinhas = 0; //Quantidade de linhas a ser tirada para que fique certo na tela
  double _qtdBombas = 0; //Quantidade de bombas dentro do tabuleiro
  
  Dificuldade(this._colunas, this._menosLinhas, this._qtdBombas); //Construtor

  //Getters and setters
  int get colunas => _colunas;

  set colunas(int value) => _colunas = value;

  int get menosLinhas => _menosLinhas;

  set menosLinhas(int value) => _menosLinhas = value;

  double get qtdBombas => _qtdBombas;

  set qtdBombas(double value) => _qtdBombas = value;
}