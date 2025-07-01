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
You are an intelligent assistant specialized only in topics related to gym, fitness, workouts, nutrition, and training plans. 
Do not answer any questions that are not related to these areas.

Question: $prompt
""")
      ];
      final response = await model.generateContent(promptContent);
      final result = response.text;
      log(result.toString());
      return result ?? AppStrings.failedToGetAResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
