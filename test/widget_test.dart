// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:moslem_pocket/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MoslemPocketApp());

    // Verify that the splash screen shows the correct text.
    expect(find.text("Moslem Pocket"), findsOneWidget);
    expect(find.text("Get Started"), findsOneWidget);
  });
}
