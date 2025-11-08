import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

final userId = FirebaseAuth.instance.currentUser!.uid;

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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('userCartTempCollection')
            .where('UID', isEqualTo: userId)
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

          //  Ca
          double totalPrice = orderDetials.fold<double>(0, (sum, doc) {
            final data = doc.data() as Map<String, dynamic>;
            final itemPrice = data['Price'];

            double parsedPrice;
            if (itemPrice is num) {
              parsedPrice = itemPrice.toDouble();
            } else {
              parsedPrice = double.tryParse(itemPrice.toString()) ?? 0;
            }

            return sum + parsedPrice;
          });

          return Column(
            children: [
              const SizedBox(height: 20),

              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                  
                    await FirebaseFirestore.instance
                        .collection('userHistoryCollection')
                        .doc()
                        .set({
                      'UID': userId,
                      'TotalPrice': totalPrice.toString(),
                      'date': FieldValue.serverTimestamp(),
                    });

                   
                    for (var doc in orderDetials) {
                      await doc.reference.delete();
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order Confirmed!")),
                    );
                  },
                  child: const Text("Confirm Order"),
                ),
              ),

              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Total: $totalPrice",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

             
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
                      trailing: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor:
                              const Color.fromARGB(255, 149, 237, 247),
                          highlightColor:
                              const Color.fromARGB(255, 149, 237, 247),
                          radius: 10,
                          onTap: () async {
                            await orderDoc.reference.delete();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(orderData['Price'].toString()),
                              const Icon(Icons.delete),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
