import 'package:shared_services/shared_services.dart';
import 'package:shared_models/shared_models.dart';
import 'package:test/test.dart';

void main() {
  test('quickBook creates pending booking', () async {
    final facade = SapuJagadFacade(
      services: InMemoryServiceRepository(),
      bookings: InMemoryBookingRepository(),
    );
    final svc = (await facade.quickServices()).first;
    final booking = await facade.quickBook(
      id: 'b1',
      userId: 'u1',
      service: svc,
      schedule: DateTime(2025, 1, 1, 9),
      durationMinutes: 60,
    );
    expect(booking.status, BookingStatus.pending);
  });
}