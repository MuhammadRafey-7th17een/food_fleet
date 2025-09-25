import 'package:flutter/material.dart';
import 'package:food_fleet/pages/rider_settings.dart';

class Riderhomepage extends StatefulWidget {
  const Riderhomepage({super.key});

  @override
  State<Riderhomepage> createState() => _RiderhomepageState();
}

class _RiderhomepageState extends State<Riderhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF98BCF9),
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF5677BA),
        toolbarHeight: 134,
        title: Image.asset(
          'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),

      // Drawer
      drawer: Drawer(
        elevation: 20,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFCBE4DE), Color(0xFF707E7B)],
              stops: [0.70, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top icons
              Column(
                children: [
                  const SizedBox(height: 50),
                  IconButton(
                    icon: const Icon(Icons.settings, size: 40),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RiderSettings()),
                    );
                    },
                  ),
                ],
              ),

              // Bottom FOOD FLEET logo
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const Text(
                      "FOOD FLEET",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Body
      body: Column(
        children: [
          const Spacer(), // pushes content to center

          // Accept + Reject buttons across full row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(), // pushes content to center
        ],
      ),
    );
  }
}
