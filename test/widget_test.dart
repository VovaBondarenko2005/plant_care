
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_care/screens/login_screen.dart';

void main() {
  testWidgets(
    'PlantCare login screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      expect(
        find.text('PlantCare'),
        findsOneWidget,
      );

      expect(
        find.text('Увійти'),
        findsOneWidget,
      );

      expect(
        find.text('Реєстрація'),
        findsOneWidget,
      );
    },
  );
}
