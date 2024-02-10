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
                  Icons.cloud_upload_outlined,
                  size: 200, // Decreased icon size
                  color: Color.fromARGB(255, 48, 45, 45), // Icon color
                ),
                const SizedBox(height: 10), // Spacer
                TextButton(
                  onPressed: () {
                    // Placeholder for browse action
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Colors.grey[300], // Grey background for Browse button
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24), // Adjust button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded shape
                    ),
                  ),
                  child: const Text(
                    'Browse',
                    style: TextStyle(fontSize: 24), // Increased text size
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120), // Space between buttons
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.7, // Scan button spans 70% of the width
              child: ElevatedButton.icon(
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
            ),
          ],
        ),
      ),
    );
  }
}
