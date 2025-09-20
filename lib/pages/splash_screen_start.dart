import 'package:flutter/material.dart';
import 'package:food_fleet/pages/log_in_page.dart';

class StartSplashScreen extends StatelessWidget {
  const StartSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
                child: Material(
                  child: InkWell(
                    child: Text(
                      "Test Next Screen Button",
                      style: TextStyle(fontSize: 28),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
