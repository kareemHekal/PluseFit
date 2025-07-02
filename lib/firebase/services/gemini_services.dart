import 'dart:developer';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GeminiServices {
  Future<String> sendAPromptRequest(String prompt) async {
    final model =
        FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
    // Provide a prompt that contains text
    final promptContent = [
      Content.text("""
You are a smart assistant specializing only in sports, fitness, exercise, and nutrition. Please respond in the same language you were sent.
Question: $prompt
""")
    ];
    final response = await model.generateContent(promptContent);
    final result = response.text;
    log(response.toString());
    log(result.toString());
    return result ?? AppStrings.failedToGetAResponse;
  }
}
