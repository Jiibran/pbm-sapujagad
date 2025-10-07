import 'package:flutter_test/flutter_test.dart';
import 'package:tasker_app/main.dart';

void main() {
  testWidgets('Tasker app renders', (tester) async {
    await tester.pumpWidget(const TaskerApp());
    await tester.pumpAndSettle();
    expect(find.text('SapuJagad Tasker'), findsOneWidget);
  });
}