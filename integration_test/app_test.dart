import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_pw10/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Test Login', () {
    testWidgets('Test Email Field', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      await tester.enterText(find.byKey(const ValueKey('fieldEmail')),
          'testuser@testmail.testdomain');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('testuser@testmail.testdomain'), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('fieldPhone')), '000800070006');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('000800070006'), findsOneWidget);
      await tester.tap(find.text('Отправить'));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  group('Test Register', () {
    testWidgets('Register form tests', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('switchButton')));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      await tester.enterText(
          find.byKey(const ValueKey('fieldName')), 'TestName');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('TestName'), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('fieldLastName')), 'TestLastName');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('TestLastName'), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('fieldLastName')), 'TestLastName');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('TestLastName'), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('fieldPhone')), '000800070006');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('000800070006'), findsOneWidget);
      await tester.enterText(find.byKey(const ValueKey('fieldEmail')),
          'testuser@testmail.testdomain');
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text('testuser@testmail.testdomain'), findsOneWidget);

      await tester.tap(find.text('Отправить'));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
