import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traces/pages/authentication/authentication.dart';

void main() {
  testWidgets('authentication page renders email input and buttons',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: AuthenticationPage(),
      ),
    );

    // Verify that the email input field and buttons are present
    expect(find.text('Enter Your Email Address'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('Continue with Apple'), findsOneWidget);
  });

  testWidgets('continue button triggers navigation to password page',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: AuthenticationPage(),
      ),
    );

    // Enter email text and tap the "Continue" button
    await tester.enterText(find.byType(TextField), 'user@example.com');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify that the PasswordPage has been navigated to
    expect(find.byType(PasswordPage), findsOneWidget);
  });
}
