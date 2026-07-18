import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart'; // Import halaman login

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setting timer: Setelah 3 detik, otomatis pindah ke halaman Login
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- BACKGROUND DEKORASI (Simulasi ombak merah) ---
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: -80,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- KONTEN UTAMA (Logo & Teks) ---
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gambar Logo PMI
                Image.asset(
                  'assets/images/pmi_logo.jpg',
                  width: 220, // Sesuaikan ukuran logo
                ),
                const SizedBox(height: 40),
                
                // Teks Judul
                const Text(
                  'Setetes',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE53935), // Warna merah PMI
                  ),
                ),
                const SizedBox(height: 8),
                
                // Teks Sub-judul
                const Text(
                  'Wujudkan\nKepedulianmu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF5350), // Merah sedikit lebih muda
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}