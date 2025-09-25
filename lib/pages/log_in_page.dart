import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_homepage.dart'; // import your homepage after login

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // FirebaseAuth instance
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> login() async {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // ✅ Go to homepage on success
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Userhomepage()),
        );
      } on FirebaseAuthException catch (e) {
        // Show error if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Login failed")),
        );
      }
    }

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

              // 🔒 Password
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

              // 🔘 Login button
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
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        login();
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
