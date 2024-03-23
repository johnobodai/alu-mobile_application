import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/controllers/user_controller.dart';
import '/firebase_options.dart';
import '/pages/home_page.dart';
import '/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home:
          UserController.user != null ? const HomeScreen() : const LoginPage(),
    );
  }
}
