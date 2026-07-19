import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sfere/sfere.dart';

void main() {
  testWidgets('CustomSfere.builder builds with the initial empty state',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomSfere<int>.builder(
          builder: (context, values) => Text('count: ${values.length}'),
        ),
      ),
    ));
    expect(find.text('count: 0'), findsOneWidget);
  });

  testWidgets('SferePoints contribute their values into the scope',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomSfere<int>(
          child: Column(
            children: [
              CustomSfereBuilder<int>(
                builder: (context, values) => Text('count: ${values.length}'),
              ),
              SferePoint<int>(value: 1, child: const SizedBox.shrink()),
              SferePoint<int>(value: 2, child: const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text('count: 2'), findsOneWidget);
  });
}
