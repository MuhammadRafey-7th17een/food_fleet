import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A153A), Color(0XFF483AA0)],
            stops: [0.05, 0.37],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF8576FF),
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

              SizedBox(height: 20),
              Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF8576FF),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Color(0xFFFFD0EC)),
                  decoration: InputDecoration(
                    labelText: "Password",
                    hint: Text("****"),
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
              SizedBox(height: 20),
              Container(
                width: 107,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2C),
                  border: Border.all(color: Color(0xFF8576FF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Color(0xFFFFD0EC)),
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
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
