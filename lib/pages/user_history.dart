import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

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
      backgroundColor: Color(0xFF98BCF9),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF5677BA),
        centerTitle: true,
        title: Text(
          "History",
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
                final currentCart = await FirebaseFirestore.instance
                    .collection('userHistoryCollection')
                    .where('UID', isEqualTo: uid)
                    .get();

                for (var doc in currentCart.docs) {
                  await doc.reference.delete();
                }
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("History Cleard")));
              },
              child: Text("Clear History"),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('userHistoryCollection')
                  .where('UID', isEqualTo: uid)
                  .snapshots(),

              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final historyDetials = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: historyDetials.length,
                  itemBuilder: (BuildContext context, index) {
                    final docs = historyDetials[index];
                    final docData = docs.data() as Map<String, dynamic>;
                    Timestamp getting = docData['date'];
                    DateTime date = getting.toDate();
                    return ListTile(
                      title: Text(docData['TotalPrice'].toString()),
                      trailing: Text(date.toString()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
