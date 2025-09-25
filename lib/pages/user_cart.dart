import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  String price = '';
  double showPrice = 0.0;
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Order Confirmed!")),
                );
              },
              child: Text("Confirm Order"),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
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
                for (var doc in orderDetials) {
                  final data = doc.data() as Map<String, dynamic>;
                  price = data['Price'].toString();
                  showPrice = showPrice + double.parse(price);
                }

                return Column(
                  children: [
                    Text("Total: $showPrice"),

                    Expanded(
                      child: ListView.builder(
                        itemCount: orderDetials.length,
                        itemBuilder: (BuildContext context, index) {
                          final orderDoc = orderDetials[index];
                          final orderData =
                              orderDoc.data() as Map<String, dynamic>;

                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(orderData['URL']),
                            ),
                            title: Text(orderData['ItemName'].toString()),
                            subtitle: Text(orderData['hotel_id'].toString()),
                            trailing: Text(orderData['Price'].toString()),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
