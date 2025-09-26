import 'package:flutter/material.dart';
import 'package:food_fleet/pages/rider_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_fleet/pages/ridersignup.dart';
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
        shadowColor: Color(0xFF45FFCA),
        surfaceTintColor: Color(0xFF35A29F),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFCBE4DE), Color(0xFF707E7B)],
              stops: [0.70, 1.0],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 50),
              ListTile(
                leading: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Ridersignup(),
                        ),
                      );
                    },
                    icon: Icon(Icons.logout),
                    iconSize: 30,
                    splashColor: Color(0xFFE3F6FF),
                    highlightColor: Color(0xFFE3F6FF),
                  ),
                ),
              ),
             
             
              SizedBox(height: 10),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RiderSettings(),
                        ),
                      );
                    },
                    icon: Icon(Icons.settings),
                    iconSize: 60,
                    splashColor: Color(0xFFE3F6FF),
                    highlightColor: Color(0xFFE3F6FF),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.center,
                  child: Text("Setting", style: TextStyle(fontSize: 20)),
                ),
              ),

              SizedBox(height: 50),
              Image.asset(
                'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',

                fit: BoxFit.contain,
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
