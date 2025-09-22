import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoreCurrentItems extends StatelessWidget {
  const StoreCurrentItems({super.key});

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
      backgroundColor: Color(0xFF98BCF9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF5677BA),
        centerTitle: true,
        title: Text(
          "Current Items",
          style: TextStyle(fontSize: 32, color: Color(0xFFEBD3F8)),
        ),
      ),
    );
  }
}
