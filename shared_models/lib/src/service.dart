import 'package:equatable/equatable.dart';

enum ServiceCategory {
  dailyClean,
  deepClean,
  hydroCleaning,
  acAndElectronics,
}

class Service extends Equatable {
  final String id;
  final String name;
  final String description;
  final ServiceCategory category;
  final int baseDurationMinutes; // default duration suggestion
  final int basePrice; // in smallest currency unit (e.g., IDR)

  const Service({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.baseDurationMinutes,
    required this.basePrice,
  });

  @override
  List<Object?> get props => [id, name, description, category, baseDurationMinutes, basePrice];
}