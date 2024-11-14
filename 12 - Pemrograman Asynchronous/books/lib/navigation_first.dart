import 'package:flutter/material.dart';
import 'navigation_second.dart'; // Pastikan untuk mengimpor NavigationSecond

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = const Color.fromRGBO(197, 202, 233, 1); // Warna awal

  // Method untuk navigasi dan mengambil warna dari halaman kedua
  Future<void> _navigateAndGetColor(BuildContext context) async {
    // Navigasi ke halaman kedua dan mendapatkan warna yang dipilih
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    ) ?? const Color.fromRGBO(159, 168, 218, 1); // Jika tidak ada warna, gunakan warna default
    setState(() {}); // Update tampilan dengan warna baru
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, // Set background color dengan warna yang dipilih
      appBar: AppBar(
        title: const Text('Navigation First - Sofiaa'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context); // Panggil method navigasi
          },
        ),
      ),
    );
  }
}