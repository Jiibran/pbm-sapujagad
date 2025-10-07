import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String? address;

  const AppUser({
    required this.id,
    required this.name,
    required this.phone,
    this.address,
  });

  @override
  List<Object?> get props => [id, name, phone, address];
}