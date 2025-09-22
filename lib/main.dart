import 'package:flutter/material.dart';
import 'package:food_fleet/pages/User_homepage.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/splash_screen_start.dart';
import 'package:food_fleet/pages/store_home_page.dart';
import 'package:food_fleet/pages/user_history.dart';
import 'package:food_fleet/pages/user_signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:Userhomepage());
  }
}
