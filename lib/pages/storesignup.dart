import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Storesignup extends StatefulWidget {
  const Storesignup({super.key});

  @override
  State<Storesignup> createState() => _StoresignupState();
}

class _StoresignupState extends State<Storesignup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    locationController.dispose();
    numberController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection("stores")
            .doc(credential.user!.uid)
            .set({
          "email": emailController.text.trim(),
          "phone": numberController.text.trim(),
          "location": locationController.text.trim(),
          "createdAt": DateTime.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Store account created successfully!")),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      }
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
            colors: [Color(0xFF1A153A), Color(0XFF483AA0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    controller: emailController,
                    label: "Email",
                    hint: "abc@gmail.com",
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter email" : null,
                  ),
                  const SizedBox(height: 15),

                  _buildTextField(
                    controller: passwordController,
                    label: "Password",
                    hint: "*****",
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  _buildTextField(
                    controller: locationController,
                    label: "Location",
                    hint: "A Town, Street X",
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter location" : null,
                  ),
                  const SizedBox(height: 15),

                  _buildTextField(
                    controller: numberController,
                    label: "Phone Number",
                    hint: "+92 330-111-111",
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter number" : null,
                  ),
                  const SizedBox(height: 25),

                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF2C2C2C),
                          foregroundColor: const Color(0xFFFFD0EC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      width: 290,
      height: 40,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Color(0xFFFFD0EC)),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
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
        obscureText: obscure,
        validator: validator,
      ),
    );
  }
}
