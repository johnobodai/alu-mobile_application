import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/landing_page.dart';

void main() {
  testWidgets('Landing Page Widget Test', (WidgetTester tester) async {
    // Build the LandingPage widget
    await tester.pumpWidget(MaterialApp(home: LandingPage()));

    // Verify the presence of key widgets
    expect(find.text('InsightLens'), findsOneWidget);
    expect(find.text('Scan, Understand, Thrive'), findsOneWidget);
    expect(find.text('Precision Insights, Intelligent Living'), findsOneWidget);
    expect(
        find.text(
            'Scan smarter, live wiser. Our app delivers precise insights and tailored guidance for an intelligent and empowered life.'),
        findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
