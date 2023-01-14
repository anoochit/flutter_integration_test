import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Increment test",
    (tester) async {
      // load my app
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Verify that our counter starts at 0.
      expect(
        find.text('0'),
        findsOneWidget,
        reason: '==> Counter must start at 0',
      );
      expect(
        find.text('1'),
        findsNothing,
        reason: '==> Counter start at 0 must not be 1',
      );

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter after tap + button
      expect(find.text('0'), findsNothing,
          reason: '==> Tap increment to 1 not 0');
      expect(
        find.text('1'),
        findsOneWidget,
        reason: '==> Tap increment to 1',
      );

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter after tap + button
      expect(find.text('2'), findsOneWidget, reason: '==> Tap increment to 2');

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter after tap + button
      expect(find.text('3'), findsOneWidget, reason: '==> Tap increment to 3');
    },
  );
}
