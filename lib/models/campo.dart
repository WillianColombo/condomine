class Campo {
  int? numColuna;
  int? numLinha;

  Campo(this.numColuna, this.numLinha,);

  bool minado = false;
  bool _aberto = false;
  bool _flag = false;
  int qtdBombasAdj = 0;
  int num = 0;

  void minar(){
    minado = true;
  }

  void abrir(){ //Método que abre os campos
    if(_flag == false){ //Proteção contra miss click
      if(minado == false && _aberto == false){
        _aberto = true;
        //setState(() {
          num = 1;
        //});
      } else if(minado == true){
        //setState(() {
          num = 9;
        //});
      }
    }
  }

  void alternarFlag(){
    if(_aberto == false){
      _flag =! _flag;
      //setState(() {
        if(_flag == true){
          num = 8;
        } else {
          num = 0;
        }
      //});
    }
  }

 bool get getMinado => minado;
}