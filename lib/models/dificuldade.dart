class Dificuldade {
  int _colunas = 0;
  int _menosLinhas = 0;
  double _qtdBombas = 0;
  
  Dificuldade(this._colunas, this._menosLinhas, this._qtdBombas);

  Dificuldade facil(){
    Dificuldade _dificuldade = Dificuldade(29, 2, 0.15);
    return _dificuldade;
  }

  Dificuldade medio(){
    Dificuldade _dificuldade = Dificuldade(50, 0, 0.2);
    return _dificuldade;
  }

  Dificuldade dificil(){
    Dificuldade _dificuldade = Dificuldade(70, 0, 0.3);
    return _dificuldade;
  }

  get colunas => this._colunas;

  get menosLinhas => this._menosLinhas;

  get qtdBombas => this._qtdBombas;

}