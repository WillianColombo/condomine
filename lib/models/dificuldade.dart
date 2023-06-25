class Dificuldade {
  int _colunas = 0;
  int _menosLinhas = 0;
  double _qtdBombas = 0;
  
  Dificuldade(this._colunas, this._menosLinhas, this._qtdBombas);

  int get colunas => _colunas;

  set colunas(int value) => _colunas = value;

  int get menosLinhas => _menosLinhas;

  set menosLinhas(int value) => _menosLinhas = value;

  double get qtdBombas => _qtdBombas;

 set qtdBombas(double value) => _qtdBombas = value;
}