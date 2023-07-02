import 'package:condomine/models/campo.dart';
import 'package:flutter/material.dart';

//Classe que implementa a parte visual dos campos

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo)
      onAbrir; //Callback da função abrir, acionado pelo onTap do botão
  final void Function(Campo)
      onAlternarFlag; //Callback da função alterar flag, acionado pelo longPress do botão

  CampoWidget({
    //Construtor
    required this.campo,
    required this.onAbrir,
    required this.onAlternarFlag,
  });

  Widget _getImage() {
    //Método que retorna qual imagem o campo deve possuir. Baseia-se nos estados das variáveis desse campo
    int qtdeMinas = campo.qtdeMinasNaVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpg');
    } else {
      return Image.asset('assets/images/fechado.jpg');
    }
  }

  //Widget que retorna o getImage
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarFlag(campo),
      child: _getImage(),
    );
  }
}
