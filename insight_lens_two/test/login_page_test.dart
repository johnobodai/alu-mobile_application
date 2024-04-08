import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:insight_lens_two/pages/login_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Login Page Widget Test', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    // Verify the presence of the "Log In" text widgets
    expect(find.text('Log In'), findsWidgets);
  });

  testWidgets('Login Page Navigation Test', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: const LoginPage(),
        navigatorObservers: [mockObserver],
      ),
    );
  });
}
