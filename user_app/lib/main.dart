import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:shared_services/shared_services.dart';

void main() {
  runApp(const UserApp());
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SapuJagad: Pesan & Bersih',
      theme: AppTheme.light(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SapuJagadFacade facade;
  List services = const [];

  @override
  void initState() {
    super.initState();
    facade = SapuJagadFacade(
      services: InMemoryServiceRepository(),
      bookings: InMemoryBookingRepository(),
    );
    facade.quickServices().then((value) => setState(() => services = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SapuJagad: Pesan & Bersih')),
      body: services.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: QuickBookingSteps(
                services: services.cast(),
                onConfirm: ({required service, required durationMinutes, required schedule}) async {
                  final booking = await facade.quickBook(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    userId: 'demo-user',
                    service: service,
                    schedule: schedule,
                    durationMinutes: durationMinutes,
                  );
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking dibuat: ${booking.serviceId} pada ${booking.scheduledAt}')),
                  );
                },
              ),
            ),
    );
  }
}