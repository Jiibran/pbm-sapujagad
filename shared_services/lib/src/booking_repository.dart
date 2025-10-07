import 'dart:async';
import 'package:shared_models/shared_models.dart';

abstract class BookingRepository {
  Future<Booking> create(Booking booking);
  Future<Booking?> getById(String id);
  Stream<Booking> watch(String id);
  Future<Booking> update(Booking booking);
}

class InMemoryBookingRepository implements BookingRepository {
  final Map<String, Booking> _data = {};
  final Map<String, StreamController<Booking>> _controllers = {};

  @override
  Future<Booking> create(Booking booking) async {
    _data[booking.id] = booking;
    _controllers.putIfAbsent(booking.id, () => StreamController.broadcast());
    _controllers[booking.id]!.add(booking);
    return booking;
  }

  @override
  Future<Booking?> getById(String id) async => _data[id];

  @override
  Stream<Booking> watch(String id) => _controllers.putIfAbsent(id, () => StreamController.broadcast()).stream;

  @override
  Future<Booking> update(Booking booking) async {
    _data[booking.id] = booking;
    _controllers.putIfAbsent(booking.id, () => StreamController.broadcast());
    _controllers[booking.id]!.add(booking);
    return booking;
  }
}