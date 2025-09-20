import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
     final _formKey = GlobalKey<FormState>();
      // gpt start
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    //gpt end
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
                  // Email
                  SizedBox(
 width: 290,
  height: 40,

                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Color(0xFFFFD0EC)),
                      decoration: InputDecoration(
                        labelText: "Email",
                        hint: Text("abc@gmail.com"),
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
                  const SizedBox(height: 15),

                  // Password
                  SizedBox(
                     width: 290,
                     height: 40,
                    child: TextFormField(
                      controller: passwordController,
                      style: const TextStyle(color: Color(0xFFFFD0EC)),
                    
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "*****",
                    
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
                      obscureText: true,
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
                  ),
                  const SizedBox(height: 15),

                  // Location
                  SizedBox( width: 290,
                  height: 40,


                    child: TextFormField(
                      controller: locationController,
                      style: const TextStyle(color: Color(0xFFFFD0EC)),
                      decoration: InputDecoration(
                        labelText: "Location",
                        hint: Text("A Town, Street X"),
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
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter location"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Phone Number
                  SizedBox(
                     width: 290,
                     height: 40,


                    child: TextFormField(
                      controller: numberController,
                      style: const TextStyle(color: Color(0xFFFFD0EC)),
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hint: Text("+92 330-111-111"),
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
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter number" : null,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Centered Sign Up button
                  Center(
                    child: SizedBox(
                      width: 150,
                       height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Form submitted")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF2C2C2C), // button bg
                          foregroundColor: const Color(
                            0xFFFFD0EC,
                          ), // text color
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
}
