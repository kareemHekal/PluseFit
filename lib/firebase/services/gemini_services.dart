import 'dart:developer';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:fit_zone/core/utils/string_manager.dart';

class GeminiServices {
  static Future<String> sendAPromptRequest(String prompt) async {
    try {
      final model =
          FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
      // Provide a prompt that contains text
      final promptContent = [
        Content.text("""
You are a smart assistant specialized only in topics related to gym, fitness, workouts, nutrition, and training plans.

You must always respond in **both English and Arabic**.

If the user says a greeting like "Hello", "Hi", or "سلام عليكم", respond politely in both languages.

Do not answer questions outside of the gym and fitness field.

Question: $prompt
""")
      ];
      final response = await model.generateContent(promptContent);
      final result = response.text;
      log(response.toString());
      log(result.toString());
      return result ?? AppStrings.failedToGetAResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
