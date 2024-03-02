import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_upload_outlined,
              size: 200,
              color: Color.fromARGB(255, 48, 45, 45),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final users = snapshot.data?.docs ?? [];

                // Find the first document where email matches the signed-in user's email
                final currentUserDoc = users.firstWhere(
                  (doc) =>
                      doc['Email'] ==
                      'current_user_email_here', // Replace with the user's email
                  orElse: () => null,
                );

                if (currentUserDoc == null) {
                  return Text('User data not found');
                }

                final username = currentUserDoc['Username'] ?? 'Unknown';
                return Text(
                  'Hello, $username!',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
