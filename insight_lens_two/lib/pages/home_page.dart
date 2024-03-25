import 'package:flutter/material.dart';
import './login_page.dart';
import '../controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await UserController.signOut();
              if (mounted) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  size: 200,
                  color: Color.fromARGB(255, 48, 45, 45),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Placeholder for browse action
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Browse',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Placeholder for scan action
                },
                icon: const Icon(
                  Icons.camera_alt,
                  size: 48,
                ),
                label: const Text(
                  'Scan',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
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
