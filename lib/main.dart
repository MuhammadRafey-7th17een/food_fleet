import 'package:flutter/material.dart';
import 'package:food_fleet/pages/User_homepage.dart';
import 'package:food_fleet/pages/rider_settings.dart';
import 'package:food_fleet/pages/ridersignup.dart';
import 'package:food_fleet/pages/setting_page.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/splash_screen_start.dart';
import 'package:food_fleet/pages/store_setting.dart';
import 'package:food_fleet/pages/user_cart.dart';
import 'package:food_fleet/pages/user_signup.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StoreSetting());
  }
}
