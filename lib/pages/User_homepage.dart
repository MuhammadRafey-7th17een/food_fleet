import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_fleet/pages/setting_page.dart';
import 'package:food_fleet/pages/signup_page.dart';
import 'package:food_fleet/pages/user_cart.dart';
import 'package:food_fleet/pages/user_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Userhomepage extends StatefulWidget {
  const Userhomepage({super.key});

  @override
  State<Userhomepage> createState() => _UserhomepageState();
}

Future<String> getHotelName(String hotelId) async {
  final doc = await FirebaseFirestore.instance
      .collection('Hotels')
      .doc(hotelId)
      .get();
  return (doc.data()?['name'] ?? 'Unknown Hotel');
}

class _UserhomepageState extends State<Userhomepage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final collection = FirebaseFirestore.instance.collectionGroup(
    '1subcollection',
  );

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
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
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
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
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
                        MaterialPageRoute(
                          builder: (context) => const UserCart(),
                        ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserHistory(),
                        ),
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

                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: collection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final orderDetails = snapshot.data!.docs;
            if (orderDetails.isEmpty) {
              return const Center(child: Text("No orders found"));
            }

            return ListView.builder(
              itemCount: orderDetails.length,
              itemBuilder: (BuildContext context, index) {
                final orderDoc = orderDetails[index];

                final orderData = orderDoc.data() as Map<String, dynamic>;
                //final hotelId = orderDoc.reference.parent.parent?.id ?? "Unknown";

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(orderData['URL']),
                  ),
                  title: Text(orderData['FoodName'].toString()),
                  subtitle: Text(orderData['Description'].toString()),
                  trailing: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 149, 237, 247),
                      highlightColor: Color.fromARGB(255, 149, 237, 247),
                      radius: 10,
                      child: Column(
                        children: [
                          Text(orderData['Price'].toString()),
                          Icon(Icons.shopping_cart_checkout_sharp),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
