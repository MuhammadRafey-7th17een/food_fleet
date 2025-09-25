import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_fleet/pages/rider_homepage.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/store_home_page.dart';
import 'package:food_fleet/pages/user_homepage.dart';

class StartSplashScreen extends StatefulWidget {
  const StartSplashScreen({super.key});

  @override
  State<StartSplashScreen> createState() => _StartSplashScreenState();
}

class _StartSplashScreenState extends State<StartSplashScreen> {
  @override
  void initState() {
    super.initState();
    //_checkUser();
  }

  /*Future<void> _checkUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignUpPage()),
      );
    } else {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!mounted) return;

      if (!doc.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpPage()),
        );
        return;
      }

      final role = doc['role'];
      if (role == "store") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const StoreHomePage()),
        );
      } else if (role == "user") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Userhomepage()),
        );
      } else if (role == "rider") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Riderhomepage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpPage()),
        );
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E4189), Color(0xFF3572EF)],
            stops: [0.19, 1.0],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
                  width: 160,
                  height: 160,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
