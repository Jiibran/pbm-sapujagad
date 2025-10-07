import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final String bookingId;
  final String userId;
  final String taskerId;
  final int stars; // 1..5
  final String? comment;

  const Rating({
    required this.bookingId,
    required this.userId,
    required this.taskerId,
    required this.stars,
    this.comment,
  });

  @override
  List<Object?> get props => [bookingId, userId, taskerId, stars, comment];
}