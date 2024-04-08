import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final String generatedText;

  const ResultScreen({
    required this.imageFile,
    required this.generatedText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.file(
              imageFile,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 232, 230, 230),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              generatedText,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Your button action here
            },
            child: Text(
              'Scan',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
