import 'package:shared_models/shared_models.dart';
import 'package:test/test.dart';

void main() {
  test('Service equality and props', () {
    final s1 = Service(
      id: '1',
      name: 'Deep Clean',
      description: 'Thorough cleaning',
      category: ServiceCategory.deepClean,
      baseDurationMinutes: 120,
      basePrice: 250000,
    );
    final s2 = Service(
      id: '1',
      name: 'Deep Clean',
      description: 'Thorough cleaning',
      category: ServiceCategory.deepClean,
      baseDurationMinutes: 120,
      basePrice: 250000,
    );
    expect(s1, equals(s2));
  });
}