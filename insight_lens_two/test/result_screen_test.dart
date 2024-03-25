import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/result_screen.dart';

void main() {
  testWidgets('Result Screen Widget Test', (WidgetTester tester) async {
    // Build the ResultScreen widget
    await tester.pumpWidget(MaterialApp(home: ResultScreen()));

    // Verify the presence of key widgets
    expect(find.text('Result Screen'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.textContaining('Your result text here'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
