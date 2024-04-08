import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApi {
  static Future<String?> generateTextFromTextAndImage(
      File imageFile, String promptText) async {
    // Access your API key as an environment variable (see "Set up your API key" above)
    const apiKey = 'AIzaSyA_WTHbwY3isL8dU27OAOubMLE-ySiokR0';
    // ignore: unnecessary_null_comparison
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }

    // For text-and-image input (multimodal), use the gemini-pro-vision model
    final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);

    final prompt = TextPart(promptText);
    final imageBytes = await imageFile.readAsBytes();
    final imagePart = DataPart('image/jpeg', imageBytes);

    try {
      final response = await model.generateContent([
        Content.multi([prompt, imagePart])
      ]);
      print(response.text);
      return response.text;
    } catch (e) {
      print('Error generating text: $e');
      return null;
    }
  }
}
