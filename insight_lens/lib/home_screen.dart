import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.image,
                  size: 64, // Increased icon size
                  color: Colors.blue, // Icon color
                ),
                const SizedBox(height: 10), // Spacer
                TextButton(
                  onPressed: () {
                    // Placeholder for browse action
                  },
                  child: const Text(
                    'Browse',
                    style: TextStyle(fontSize: 24), // Increased text size
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40), // Space between buttons
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for scan action
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 48, // Increased icon size
              ),
              label: const Text(
                'Scan',
                style: TextStyle(fontSize: 24), // Increased text size
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Blue background for the Scan button
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 24), // Adjust button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded shape
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
