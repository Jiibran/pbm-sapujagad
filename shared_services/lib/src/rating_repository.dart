import 'package:shared_models/shared_models.dart';

abstract class RatingRepository {
  Future<void> submit(Rating rating);
  Future<List<Rating>> forTasker(String taskerId);
}

class InMemoryRatingRepository implements RatingRepository {
  final List<Rating> _ratings = [];

  @override
  Future<void> submit(Rating rating) async {
    _ratings.removeWhere((r) => r.bookingId == rating.bookingId);
    _ratings.add(rating);
  }

  @override
  Future<List<Rating>> forTasker(String taskerId) async =>
      _ratings.where((r) => r.taskerId == taskerId).toList(growable: false);
}