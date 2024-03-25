import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/signup_page.dart';

void main() {
  testWidgets('Sign Up Page Widget Test', (WidgetTester tester) async {
    // Build the SignUpScreen widget
    await tester.pumpWidget(MaterialApp(home: SignUpScreen()));

    // Verify the presence of key widgets
    expect(find.text('Sign Up'), findsNWidgets(3));
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });
}
