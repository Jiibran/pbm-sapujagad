import 'package:flutter_test/flutter_test.dart';
import 'package:admin_dashboard/main.dart';

void main() {
  testWidgets('Admin dashboard renders', (tester) async {
    await tester.pumpWidget(const AdminApp());
    await tester.pumpAndSettle();
    expect(find.text('SapuJagad Command Center'), findsOneWidget);
  });
}