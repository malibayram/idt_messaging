import 'package:flutter_test/flutter_test.dart';

import 'package:idt_messaging/main.dart';
import 'package:idt_messaging/res/index.dart';

void main() {
  testWidgets('MyApp chatScreen ChatCard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Keys.chatScreen), findsOneWidget);

    // await Future.delayed(const Duration(seconds: 1));

    // expect(find.byType(ChatCard), findsNWidgets(3));
  });
}
