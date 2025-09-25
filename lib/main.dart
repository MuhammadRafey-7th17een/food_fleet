import 'package:flutter/material.dart';
import 'package:food_fleet/pages/rider_homepage.dart';
import 'firebase_options.dart';
import 'package:food_fleet/pages/user_homepage.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // removes the debug banner
      title: "Food Fleet",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Change this to the page you want to open first
      home:Userhomepage(),  
      // home: const RiderHomepage(),
    );
  }
}