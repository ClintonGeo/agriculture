// lib/main.dart

import 'package:flutter/material.dart';
// Import your new splash screen
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amsha',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      // The home property should point to your SplashScreen
      home: const SplashScreen(),
    );
  }
}