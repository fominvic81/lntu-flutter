import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lntu_flutter/main.dart';

void main() {
  testWidgets("App has correct title", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text("IPZ-33: Victor's last Flutter App"), findsOneWidget);
  });

  testWidgets("App has mouse icon", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byIcon(Icons.mouse), findsOneWidget);
  });

  testWidgets("App counter step is 2", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final counter = find.byKey(ValueKey("Counter"));
    final increment = find.byIcon(Icons.mouse);

    expect(counter, findsOneWidget);

    final firstValue = int.parse(tester.firstWidget<Text>(counter).data!);

    await tester.tap(increment);
    await tester.pump();
    final secondValue = int.parse(tester.firstWidget<Text>(counter).data!);

    await tester.tap(increment);
    await tester.pump();
    final thirdValue = int.parse(tester.firstWidget<Text>(counter).data!);

    expect(secondValue - firstValue, 2);
    expect(thirdValue - secondValue, 2);
  });
}
