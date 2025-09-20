import 'package:flutter/material.dart';
import 'package:food_fleet/pages/log_in_page.dart';
import 'package:food_fleet/pages/ridersignup.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/storesignup.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return const MaterialApp(home:LogInPage());
    

  }
}
