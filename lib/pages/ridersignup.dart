import 'package:flutter/material.dart';

class Ridersignup extends StatelessWidget {
  const Ridersignup({super.key});

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
            colors: [Color(0xFF1A153A), Color(0XFF483AA0)],
            stops: [0.05, 0.37],
          ),
        ),
      ),
    );
  }
}
