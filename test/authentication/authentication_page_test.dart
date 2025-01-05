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
}
