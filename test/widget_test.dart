import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codex/app/app.dart';

void main() {
  testWidgets('Codex app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CodexApp(),
      ),
    );

    expect(find.text('CODEX'), findsOneWidget);
  });
}
