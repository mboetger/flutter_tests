import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tests/main.dart';

void main() {
  testWidgets('TextField selection and key indicator test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our TextField is present.
    expect(find.byType(TextField), findsOneWidget);

    // Verify initial "Pressed Keys" text.
    expect(find.textContaining('Pressed Keys:'), findsOneWidget);

    // Tap the TextField to focus it.
    await tester.tap(find.byType(TextField));
    await tester.pump();

    // The rest of the bug reproduction requires native events (GBoard) 
    // which cannot be accurately simulated in a simple widget test 
    // because it bypasses the native engine embedding fix.
  });
}
