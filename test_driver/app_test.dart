// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderSubmit = find.text('Отправить');

    test(
        'Email Field',
        () => () async {
              await driver?.tap(fieldFinderEmail);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('testuser@testmail.testdomain');
              await driver?.waitFor(find.text('testuser@testmail.testdomain'));
            });
    test(
        'Phone Field',
        () => () async {
              await driver?.tap(fieldFinderPhone);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('testText');
              await driver?.waitFor(find.text(''));
              await driver?.enterText('000777000777');
              await driver?.waitFor(find.text('000777000777'));
            });
    test(
        'Submit Button',
        () => () async {
              await driver?.tap(fieldFinderSubmit);
            });

    test(
        'Successfully Logged Message',
        () => () async {
              await driver?.waitFor(find.text('Добро пожаловать'));
            });
  });

  group('Register form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    final fieldFinderName = find.byValueKey('fieldName');
    final fieldFinderLastName = find.byValueKey('fieldLastName');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderSubmit = find.text('Отправить');

    test(
        'Name Field',
        () => () async {
              await driver?.tap(fieldFinderName);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('TestName');
              await driver?.waitFor(find.text('TestName'));
            });
    test(
        'LastName Field',
        () => () async {
              await driver?.tap(fieldFinderLastName);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('TestLastName');
              await driver?.waitFor(find.text('TestLastName'));
            });
    test(
        'Phone Field',
        () => () async {
              await driver?.tap(fieldFinderPhone);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('testText');
              await driver?.waitFor(find.text(''));
              await driver?.enterText('000777000777');
              await driver?.waitFor(find.text('000777000777'));
            });
    test(
        'Email Field',
        () => () async {
              await driver?.tap(fieldFinderEmail);
              await driver?.waitFor(find.text(''));
              await driver?.enterText('testuser@testmail.testdomain');
              await driver?.waitFor(find.text('testuser@testmail.testdomain'));
            });

    test(
        'Submit Button',
        () => () async {
              await driver?.tap(fieldFinderSubmit);
            });

    test(
        'Successfully Registered Message',
        () => () async {
              await driver?.waitFor(find.text('Вы успешно зарегистрировались'));
            });
  });
}
