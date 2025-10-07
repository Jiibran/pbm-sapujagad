import 'package:shared_models/shared_models.dart';

abstract class ServiceRepository {
  Future<List<Service>> listServices();
}

class InMemoryServiceRepository implements ServiceRepository {
  final List<Service> _services = const [
    Service(
      id: 'svc-daily',
      name: 'Pembersihan Harian',
      description: 'Bersih-bersih cepat untuk harian',
      category: ServiceCategory.dailyClean,
      baseDurationMinutes: 60,
      basePrice: 100000,
    ),
    Service(
      id: 'svc-deep',
      name: 'Pembersihan Mendalam',
      description: 'Deep clean menyeluruh',
      category: ServiceCategory.deepClean,
      baseDurationMinutes: 120,
      basePrice: 250000,
    ),
    Service(
      id: 'svc-hydro',
      name: 'Sedot Tungau Kasur',
      description: 'Hydro Cleaning untuk kasur',
      category: ServiceCategory.hydroCleaning,
      baseDurationMinutes: 90,
      basePrice: 200000,
    ),
    Service(
      id: 'svc-ac',
      name: 'Servis AC & Elektronik',
      description: 'Perawatan dan servis ringan',
      category: ServiceCategory.acAndElectronics,
      baseDurationMinutes: 90,
      basePrice: 180000,
    ),
  ];

  @override
  Future<List<Service>> listServices() async => _services;
}