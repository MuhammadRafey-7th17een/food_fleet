import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_fleet/pages/setting_page.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/user_cart.dart';
import 'package:food_fleet/pages/user_history.dart';
class Userhomepage extends StatefulWidget {
  const Userhomepage({super.key});

  @override
  State<Userhomepage> createState() => _UserhomepageState();
}

class _UserhomepageState extends State<Userhomepage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  

  @override
  void dispose() {
    emailController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final formKey = GlobalKey<FormState>();
      // gpt start
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 148, 162, 189),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    //gpt end
    return Scaffold(
  backgroundColor: const Color(0xFF98BCF9),
  extendBodyBehindAppBar: true,

  appBar: AppBar(
    centerTitle: true,
  backgroundColor: const Color(0xFF5677BA),
  toolbarHeight: 134,
  title: const Text(""),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Image.asset(
        'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    ),
  ],
),

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
                        Navigator.push(
                          context,
      MaterialPageRoute(builder: (context) => const SignUpPage()
      )
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
      MaterialPageRoute(builder: (context) => const SettingsPage()
      )
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
              SizedBox(height: 10),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                        Navigator.push(
                          context,
      MaterialPageRoute(builder: (context) => const UserCart()
      )
      );
                      
                    },
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 60,
                    splashColor: Color(0xFFE3F6FF),
                    highlightColor: Color(0xFFE3F6FF),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.center,
                  child: Text("Cart", style: TextStyle(fontSize: 20)),
                ),
              ),
               SizedBox(height: 10),
              ListTile(
                title: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {   Navigator.push(
                          context,
      MaterialPageRoute(builder: (context) => const UserHistory()
      )
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
               
      SizedBox(height: 50),
       Image.asset(
        'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
   
            ],
          ),

  ),
),

  body: Center(
    child: Text("Main Content"),
  ),
);
  }
}





   

