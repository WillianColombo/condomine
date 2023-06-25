import 'package:condomine/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir Campo COM Explosão', () {
      Campo c = Campo(0, 0);
      c.minar();

      expect(c.abrir, throwsException);
    });

    test('Abrir Campo SEM Explosão', () {
      Campo c = Campo(0, 0);
      c.abrir();
      expect(c.aberto, isTrue);
    });

    test('Adicionar NÃO Vizinho', () {
      Campo c1 = Campo(0, 0);
      Campo c2 = Campo(1, 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar Vizinho', () {
      Campo c1 = Campo(3, 3);
      Campo c2 = Campo(3, 4);
      Campo c3 = Campo(2, 2);
      Campo c4 = Campo(4, 4);

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(c1.vizinhos.length, 3);
    });
    
    test('Minas na Vizinhança', () {
      Campo c1 = Campo(3, 3);

      Campo c2 = Campo(3, 4);
      c2.minar();

      Campo c3 = Campo(2, 2);

      Campo c4 = Campo(4, 4);
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(c1.qtdeMinasNaVizinhanca, 2);
    });
  });
}
