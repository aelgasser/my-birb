import 'package:birb/no_content.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:birb/main.dart';

void main() {
  testWidgets('basic smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Birb'), findsOneWidget);
    expect(find.byType(NoContent), findsOneWidget);
  });
}
