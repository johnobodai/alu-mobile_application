import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/user_controller.dart';
import './login_page.dart';
import '../controllers/gemini_api.dart'; // Import the Gemini API integration file
import './result_screen.dart'; // Import the result screen file

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _pickedImage;
  String _scanResult = '';
  bool _loading = false;

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
                _pickedImage != null
                    ? Image.file(
                        _pickedImage!,
                        height: 200,
                        width: 200,
                      )
                    : const Icon(
                        Icons.cloud_upload_outlined,
                        size: 200,
                        color: Color.fromARGB(255, 48, 45, 45),
                      ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
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
                  _pickImage(ImageSource.camera);
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
            const SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : Text(_scanResult),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImageFile = await ImagePicker().pickImage(source: source);
    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
        _loading = true; // Set loading to true when image is picked
      });
      await _generateTextFromImage();
    }
  }

  Future<void> _generateTextFromImage() async {
    if (_pickedImage == null) {
      return; // No image picked
    }

    // Call Gemini API to generate text from text-and-image input
    String? generatedText = await GeminiApi.generateTextFromTextAndImage(
        _pickedImage!, 'What is in this image?');

    setState(() {
      _loading = false; // Set loading to false after receiving response
    });

    // Navigate to the result screen and pass the generated text as a parameter
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          imageFile: _pickedImage!,
          generatedText: generatedText ?? 'Error generating text',
        ),
      ),
    );
  }
}
