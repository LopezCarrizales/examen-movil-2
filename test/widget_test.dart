import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pura_fe/main.dart';

void main() {
  testWidgets('Muestra el estado vacio del registro de peso',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Registro de Peso'), findsOneWidget);
    expect(find.text('No hay registros'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Agrega un nuevo registro', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Nuevo registro'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), '17 de Noviembre');
    await tester.enterText(find.byType(TextFormField).at(1), '75.5');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(find.text('17 de Noviembre'), findsOneWidget);
    expect(find.text('75.5 kg'), findsOneWidget);
    expect(find.text('No hay registros'), findsNothing);
  });
}
