import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirebaseForm(),
    );
  }
}

class FirebaseForm extends StatefulWidget {
  const FirebaseForm({super.key});

  @override
  _FirebaseFormState createState() => _FirebaseFormState();
}

class _FirebaseFormState extends State<FirebaseForm> {
  final TextEditingController _textFieldController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submitData() {
    String inputData = _textFieldController.text;
    _firestore.collection('Editors').add({
      'input_data': inputData,
    }).then((_) {
      // Data successfully written to Firestore
      // Clear the text field after submission
      _textFieldController.clear();
    }).catchError((error) {
      // Handle any errors that occur during submission
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
