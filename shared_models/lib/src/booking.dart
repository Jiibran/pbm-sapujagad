import 'package:equatable/equatable.dart';

enum BookingStatus { pending, accepted, enRoute, inProgress, completed, cancelled }

class Booking extends Equatable {
  final String id;
  final String userId;
  final String serviceId;
  final DateTime scheduledAt;
  final int durationMinutes;
  final BookingStatus status;
  final String? taskerId;
  final int? finalPrice;

  const Booking({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.scheduledAt,
    required this.durationMinutes,
    this.status = BookingStatus.pending,
    this.taskerId,
    this.finalPrice,
  });

  Booking copyWith({
    BookingStatus? status,
    String? taskerId,
    int? finalPrice,
  }) => Booking(
        id: id,
        userId: userId,
        serviceId: serviceId,
        scheduledAt: scheduledAt,
        durationMinutes: durationMinutes,
        status: status ?? this.status,
        taskerId: taskerId ?? this.taskerId,
        finalPrice: finalPrice ?? this.finalPrice,
      );

  @override
  List<Object?> get props => [id, userId, serviceId, scheduledAt, durationMinutes, status, taskerId, finalPrice];
}