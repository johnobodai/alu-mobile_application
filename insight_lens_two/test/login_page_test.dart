import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../lib/pages/login_page.dart';
import '../lib/controllers/user_controller.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Login Page Widget Test', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(
      MaterialApp(
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
        home: LoginPage(),
        navigatorObservers: [mockObserver],
      ),
    );
  });
}
