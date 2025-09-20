import 'package:flutter/material.dart';
import 'package:food_fleet/pages/log_in_page.dart';
import 'package:food_fleet/pages/splash_screen_start.dart';
import 'package:food_fleet/pages/storesignup.dart';
import 'package:food_fleet/pages/signup_page.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage());
  }
}
