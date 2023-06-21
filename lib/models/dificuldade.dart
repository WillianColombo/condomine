class Dificuldade {
  int _colunas = 0;
  int _menosLinhas = 0;
  double _qtdBombas = 0;
  
  Dificuldade(this._colunas, this._menosLinhas, this._qtdBombas);

  int get colunas => this._colunas;

  set colunas(int value) => this._colunas = value;

  int get menosLinhas => this._menosLinhas;

  set menosLinhas(int value) => this._menosLinhas = value;

  double get qtdBombas => this._qtdBombas;

 set qtdBombas(double value) => this._qtdBombas = value;
}