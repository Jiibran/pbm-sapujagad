import 'package:equatable/equatable.dart';

class Tasker extends Equatable {
  final String id;
  final String name;
  final double rating; // 0..5
  final bool online;

  const Tasker({
    required this.id,
    required this.name,
    this.rating = 0,
    this.online = false,
  });

  @override
  List<Object?> get props => [id, name, rating, online];
}