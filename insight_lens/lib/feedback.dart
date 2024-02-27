import 'package:flutter/material.dart';

class InsightLensFeedbackForm extends StatefulWidget {
  @override
  _InsightLensFeedbackFormState createState() =>
      _InsightLensFeedbackFormState();
}

class _InsightLensFeedbackFormState extends State<InsightLensFeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provide Feedback',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _feedbackController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Your Feedback',
              hintText: 'Enter your feedback here...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String feedback = _feedbackController.text;
              if (feedback.isNotEmpty) {
                // Handle feedback
                print('Feedback submitted successfully: $feedback');
              } else {
                // Show error message if feedback is empty
                print('Please provide your feedback!');
              }
            },
            child: Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }
}
