import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:insight_lens/camera_screen.dart';
import 'package:insight_lens/firebase_options.dart';
import 'package:insight_lens/home_screen.dart';
import 'package:insight_lens/log_in_screen.dart';
import 'package:insight_lens/result_screen.dart';
import 'package:insight_lens/sign_up_screen.dart';
import 'landing_page.dart';

//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//wait Firebase;.initializeApp();
//runApp(const MyApp());
//}//
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class ThemeHelper {
  void changeTheme(String s) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InsightLens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const LandingPage(), // Set LandingPage as the home page
      routes: {
        '/sign_up': (context) => const SignUpScreen(),
        '/log_in': (context) => const LogInScreen(),
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
