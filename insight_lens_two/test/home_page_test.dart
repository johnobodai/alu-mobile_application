import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/home_page.dart';

void main() {
  testWidgets('Home Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    // Verify if the home page contains the 'Home' title
    expect(find.text('Home'), findsOneWidget);

    // Verify if the 'Browse' button is present
    expect(find.text('Browse'), findsOneWidget);

    // Verify if the 'Scan' button is present
    expect(find.text('Scan'), findsOneWidget);
  });
}
