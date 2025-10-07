import 'package:shared_models/shared_models.dart';
import 'booking_repository.dart';
import 'service_repository.dart';

class SapuJagadFacade {
  final ServiceRepository services;
  final BookingRepository bookings;

  SapuJagadFacade({required this.services, required this.bookings});

  Future<List<Service>> quickServices() => services.listServices();

  Future<Booking> quickBook({
    required String id,
    required String userId,
    required Service service,
    required DateTime schedule,
    required int durationMinutes,
  }) async {
    final booking = Booking(
      id: id,
      userId: userId,
      serviceId: service.id,
      scheduledAt: schedule,
      durationMinutes: durationMinutes,
    );
    return bookings.create(booking);
  }
}