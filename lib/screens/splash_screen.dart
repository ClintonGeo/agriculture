// lib/screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'first_screen.dart'; // Import your first onboarding screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const EntryScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is your exact UI code from HomeScreen.dart
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff0a2512),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer ellipse
            Container(
              height: screenHeight * 1.90,
              width: screenWidth * 2.50,
              decoration: BoxDecoration(
                color: const Color(0xff1d4a28),
                borderRadius: BorderRadius.circular(screenWidth * 1.5), // Responsive radius
              ),
            ),
            // Middle ellipse
            Container(
              width: screenWidth * 1.5,
              height: screenHeight * 0.70,
              decoration: BoxDecoration(
                color: const Color(0xff215a2e),
                borderRadius: BorderRadius.circular(screenWidth), // Responsive radius
              ),
            ),
            // Center white circle with logo
            Container(
              width: screenWidth * 0.85, // Slightly adjusted for better visual balance
              height: screenWidth * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/image 70.png',
                    height: screenWidth * 0.25, // Adjusted size
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'AMSHA',
                    style: TextStyle(
                      color: Color(0xff54a767),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}