import 'package:campominado/models/explosao_exception.dart';

class Campo {
  int coluna; 
  int linha;
  final List<Campo> vizinhos = []; //Lista que define os campos adjacentes ao campo em destaque

  Campo(this.coluna, this.linha,); //Construtor

  bool _minado = false;
  bool _aberto = false;
  bool _flag = false;
  bool _explodido = false;

  void adicionarVizinho(Campo vizinho) { //Adiciona os campos adjacentes ao campo de destaque
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void minar(){ //Método que mina o campo diretamente na variável
    _minado = true;
  }

  void reiniciar() { //Reinicia os métodos para que o game possa ser recomeçado
    _aberto = false;
    _flag = false;
    _minado = false;
    _explodido = false;
  }

  void revelarBomba() { //Se o campo estiver minado, revela a bomba. Isto ocorre quando o game é perdido
    if (_minado) {
      _aberto = true;
    }
  }

  void abrir() { //Método que abre o campo
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void alternarFlag(){ //Adiciona ou remove a Flag do campo, isto independe de estar minado ou não
    if(_aberto == false){
      _flag =! _flag;
    }
  }

  //Getters para acessar de fora

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _flag;
  }

  bool get resolvido { //Getter para saber se o campo esta resolvido
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

 bool get vizinhancaSegura { //Getter para saber se tem bombas aos campos adjacentes ao campo de destaque
    return vizinhos.every((v) => !v.minado);
  }

  int get qtdeMinasNaVizinhanca { //Quantifica as bombas dos campos adjacentes ao campo de destaque
    return vizinhos.where((v) => v.minado).length;
  }
}