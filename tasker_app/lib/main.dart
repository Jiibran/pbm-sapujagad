import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

void main() {
  runApp(const TaskerApp());
}

class TaskerApp extends StatelessWidget {
  const TaskerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SapuJagad Tasker',
      theme: AppTheme.light(),
      home: const TaskerHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskerHomePage extends StatelessWidget {
  const TaskerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SapuJagad Tasker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Pesanan Baru di Dekat Anda'),
              subtitle: const Text('Pembersihan Harian • 60 menit'),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text('Terima'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('Jadwal Hari Ini'),
              subtitle: const Text('2 pekerjaan • 09:00 & 14:00'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}