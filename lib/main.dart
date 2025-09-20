import 'package:flutter/material.dart';
import 'package:food_fleet/pages/splash_screen_start.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StartSplashScreen());
  }
}
