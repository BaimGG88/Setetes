import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Ubah import ini ke splash_screen

void main() {
  runApp(const SetetesApp());
}

class SetetesApp extends StatelessWidget {
  const SetetesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setetes - PMI DIY',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Ubah dari LoginScreen() menjadi SplashScreen()
      home: const SplashScreen(), 
    );
  }
}