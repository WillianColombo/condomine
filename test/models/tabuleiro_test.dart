
import 'package:condomine/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  test('Ganhar Jogo', () {

    Tabuleiro tabuleiro = Tabuleiro(
      linhas: 2,
      colunas: 2,
      qtdBombas: 0,
    );

    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    // Jogando...
    tabuleiro.campos[0].alternarFlag();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();
    tabuleiro.campos[3].alternarFlag();

    expect(tabuleiro.resolvido, isTrue);
  });
}