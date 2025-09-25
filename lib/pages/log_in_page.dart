import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_fleet/pages/rider_homepage.dart';
import 'package:food_fleet/pages/store_home_page.dart';
import 'user_homepage.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // FirebaseAuth instance

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 180,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/file_000000008fdc61faa669bc26c514dbc0 (1).png',
          fit: BoxFit.contain,
          width: 170,
          height: 170,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A153A), Color(0XFF483AA0)],
            stops: [0.05, 0.37],
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 📧 Email
              Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF8576FF),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Color(0xFFFFD0EC)),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Color(0xFFFFD0EC)),
                    filled: true,
                    fillColor: const Color(0xFF8576FF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter email" : null,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF8576FF),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Color(0xFFFFD0EC)),
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "****",
                    labelStyle: const TextStyle(color: Color(0xFFFFD0EC)),
                    filled: true,
                    fillColor: const Color(0xFF8576FF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter Password" : null,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: 107,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  border: Border.all(color: Color(0xFF8576FF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Color(0xFFFFD0EC)),
                      ),
                    ),
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter email and password"),
                            ),
                          );
                        }
                        try {
                          final credentials = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                          final user = credentials.user;
                          if (user == null) throw "Login Failed";

                          final doc = await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .get();
                          if (!doc.exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("User role not found"),
                              ),
                            );
                            return;
                          }

                          final role = doc['role'];

                          if (role == "user") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context_) => const Userhomepage(),
                              ),
                            );
                          } else if (role == "store") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StoreHomePage(),
                              ),
                            );
                          } else if (role == "rider") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context_) => const Riderhomepage(),
                              ),
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          String message = "Login failed";
                          if (e.code == "user-not-found") {
                            message = "No account found with this email";
                          } else if (e.code == "wrong-password") {
                            message = "Incorrect password";
                          }

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
