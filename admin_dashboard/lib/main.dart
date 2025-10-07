import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SapuJagad Command Center',
      theme: AppTheme.light(),
      home: const AdminHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SapuJagad Command Center'),
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Mitra'),
            Tab(text: 'Transaksi'),
            Tab(text: 'Konten'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Center(child: Text('Manajemen Mitra')),
          Center(child: Text('Laporan Transaksi')),
          Center(child: Text('Manajemen Konten')),
        ],
      ),
    );
  }
}