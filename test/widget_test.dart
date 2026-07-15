import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tests/main.dart';

void main() {
  testWidgets('Video player smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title is present.
    expect(find.text('Video Player Example'), findsOneWidget);
    
    // Since video initialization is async, we expect a progress indicator initially.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
