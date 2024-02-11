import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue, // Blue background for the app bar title
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(
              'InsightLens',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor:
            const Color(0xFF07467E), // Background color set to #07467E
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Scan, Understand, Thrive',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Precision Insights, Intelligent Living',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Scan smarter, live wiser. Our app delivers precise insights and tailored guidance for an intelligent and empowered life.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/land_img.png', // Path to land_img.png
                height: 200,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
