import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
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
      backgroundColor: const Color(0xFF98BCF9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF5677BA),
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 32, color: Color(0xFFEBD3F8)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order Confirmed!")),
                );
              },
              child: const Text("Confirm Order"),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('userCartTempCollection')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final orderDetials = snapshot.data!.docs;
              if (orderDetials.isEmpty) {
                return const Center(child: Text("No orders found"));
              }
              return ListView.builder(
                itemCount: orderDetials.length,
                itemBuilder: (BuildContext context, index) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
