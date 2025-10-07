import 'package:flutter_test/flutter_test.dart';
import 'package:user_app/main.dart';

void main() {
  testWidgets('Home renders', (tester) async {
    await tester.pumpWidget(const UserApp());
    await tester.pumpAndSettle();
    expect(find.text('SapuJagad: Pesan & Bersih'), findsOneWidget);
  });
}