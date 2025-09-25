import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup_page.dart';
import 'user_homepage.dart';
import 'store_home_page.dart';
import 'rider_homepage.dart';

class StartSplashScreen extends StatefulWidget {
  const StartSplashScreen({super.key});

  @override
  State<StartSplashScreen> createState() => _StartSplashScreenState();
}

class _StartSplashScreenState extends State<StartSplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context_) => const SignUpPage()),
      );
      return;
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!mounted) return;

      if (!doc.exists || !doc.data()!.containsKey('role')) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
        return;
      }

      final role = doc['role'];

      if (!mounted) return;

      if (role == "store") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context_) => const StoreHomePage()),
        );
      } else if (role == "user") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Userhomepage()),
        );
      } else if (role == "rider") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Riderhomepage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      }
    } catch (e) {
      // If any Firestore error occurs, fallback to SignUpPage
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    }
  }

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