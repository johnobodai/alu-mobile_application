import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'crudscreen.dart'; // Importing the CrudScreen
import 'package:insight_lens/firebase_options.dart';
import 'landing_page.dart';
import 'sign_up_screen.dart';
import 'log_in_screen.dart';
import 'home_screen.dart';
import 'result_screen.dart';
import 'camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InsightLens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: CrudScreen(), // Set CrudScreen as the home page
      routes: {
        '/sign_up': (context) => const SignUpScreen(),
        '/log_in': (context) => const LogInScreen(),
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
