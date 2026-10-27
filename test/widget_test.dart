import 'package:flutter_test/flutter_test.dart';
import 'package:vet_aware_ai/main.dart';
import 'package:vet_aware_ai/screens/welcome_screen.dart';

void main() {
  // Smoke test: the app should start on WelcomeScreen.
  // We check the widget TYPE (not text), so this test
  // stays valid even if Welcome's text changes later.
  testWidgets('App starts on WelcomeScreen', (WidgetTester tester) async {
    // 1. Launch the whole app.
    await tester.pumpWidget(const VetAwareApp());

    // 2. Wait for animations / layout to finish.
    await tester.pumpAndSettle();

    // 3. Assert WelcomeScreen is on screen.
    expect(find.byType(WelcomeScreen), findsOneWidget);
  });
}