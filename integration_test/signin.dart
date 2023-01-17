import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Signin test",
    (tester) async {
      // load my app
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // enter input form
      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), "demo@example.com");
      await tester.pump(const Duration(seconds: 3));
      await tester.enterText(fields.at(1), "Hello123");
      await tester.pump(const Duration(seconds: 3));

      // push button
      final button = find.byType(ElevatedButton);
      await tester.tap(button);
      await tester.pump(const Duration(seconds: 3));

      expect(find.text("Login failed"), findsNothing);
      expect(find.text("Loged in"), findsOneWidget);
    },
  );
}
