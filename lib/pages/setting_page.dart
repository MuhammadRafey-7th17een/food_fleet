import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';





class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {





// Get the current logged-in user
    User? user = FirebaseAuth.instance.currentUser;





    
    return Scaffold(
      backgroundColor: const Color(0xFF98BCF9), // Body color
      appBar: AppBar(
        backgroundColor: const Color(0xFF5677BA), 
         foregroundColor: Colors.white,// AppBar color
        title: const Text("Settings"),
        centerTitle: true,
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
             Text(
              "User Name: ${user?.displayName ?? 'Not Set'}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black, thickness: 1),
            const SizedBox(height: 8),
             Text(
               "Email: ${user?.email ?? 'No Email'}",
              style: TextStyle(fontSize: 15),
            ),
            const Divider(color: Colors.black, thickness: 1),
            const SizedBox(height: 40),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3ABEF9), // Button color
                  foregroundColor: Colors.black, // Text color
                ),
                onPressed: () {},
                child: const Text("Change User Name"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3ABEF9), // Button color
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text("Change Email"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3ABEF9), 
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text("Change Password"),
              ),
            ),
             const Spacer(),

      Center(
        child: InkWell(
           onTap: () {
            debugPrint("Contact Us !");
          },
          child: Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
