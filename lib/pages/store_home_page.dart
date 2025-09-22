import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/store_current_items.dart';
import 'package:food_fleet/pages/store_history.dart';

import 'package:food_fleet/pages/store_setting.dart';

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
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
              SizedBox(height: 90),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreSetting(),
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
                  child: Text("Settings", style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreHistory(),
                        ),
                      );
                    },
                    icon: Icon(Icons.history),
                    iconSize: 60,
                    splashColor: Color(0xFFE3F6FF),
                    highlightColor: Color(0xFFE3F6FF),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.center,
                  child: Text("History", style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreCurrentItems(),
                        ),
                      );
                    },
                    icon: Icon(Icons.archive_outlined),
                    iconSize: 60,
                    splashColor: Color(0xFFE3F6FF),
                    highlightColor: Color(0xFFE3F6FF),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.center,
                  child: Text("Current Items", style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Image.asset(
                  "assets/file_000000008fdc61faa669bc26c514dbc0 (1).png",
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color(0xFF5677BA),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              "assets/file_000000008fdc61faa669bc26c514dbc0 (1).png",
              width: 90,
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}
