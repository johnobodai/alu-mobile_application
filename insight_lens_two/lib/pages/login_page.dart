import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import 'package:iconly/iconly.dart';

import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginWithEmailPassword() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    try {
      final user =
          await UserController.loginWithEmailAndPassword(email, password);
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (error) {
      print(error.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.message ?? "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red, // Set the background color to red
      ));
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red, // Set the background color to red
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Keep me in'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Placeholder for "Forgot password?"
                        },
                        child: const Text('Forgot password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _loginWithEmailPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FilledButton.tonalIcon(
                    onPressed: () async {
                      try {
                        final user = await UserController.loginWithGoogle();
                        if (user != null && mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (error) {
                        print(error.message);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            error.message ?? "Something went wrong",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor:
                              Colors.red, // Set the background color to red
                        ));
                      } catch (error) {
                        print(error);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            error.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor:
                              Colors.red, // Set the background color to red
                        ));
                      }
                    },
                    icon: const Icon(IconlyLight.login),
                    label: const Text("Continue with Google"),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
