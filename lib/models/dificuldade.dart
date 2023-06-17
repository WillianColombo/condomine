class Dificuldade {
  int _colunas = 0;
  int _menosLinhas = 0;
  double _qtdBombas = 0;

  Dificuldade(this._colunas, this._menosLinhas, this._qtdBombas);

  Dificuldade facil(){
    Dificuldade dificuldade = Dificuldade(50, 0, 0.15);
    return dificuldade;
  }
}