import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'sign_up_screen.dart';
import 'log_in_screen.dart';
import 'home_screen.dart';
import 'result_screen.dart';
import 'camera_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InsightLens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      initialRoute: '/',
      routes: {
        '/sign_up': (context) => const SignUpScreen(),
        '/log_in': (context) => const LogInScreen(),
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/result': (context) => ResultScreen(),
      },
      //home: ResultScreen(),
      //home: CameraScreen(),
    );
  }
}
