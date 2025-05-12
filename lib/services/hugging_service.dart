import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingService {
  final String _apiKey = your_api_key; // Replace with your Hugging Face API key
  // You can get your API key from https://huggingface.co/settings/tokens
  final String _model =
      'SamLowe/roberta-base-go_emotions'; // or any other supported model

  Future<String> generateText(String prompt) async {
    final url = Uri.parse(
      'https://api-inference.huggingface.co/models/$_model',
    );

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'inputs': prompt}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Format: [[{"label": "...", "score": ...}, {...}, ...]]
      if (data is List && data.isNotEmpty && data[0] is List) {
        final emotions = data[0] as List<dynamic>;
        final result = emotions
            .map(
              (e) => "${e['label']}: ${(e['score'] * 100).toStringAsFixed(2)}%",
            )
            .join('\n');
        return result;
      } else {
        return "Unexpected model response format.";
      }
    } else if (response.statusCode == 404) {
      throw Exception(
        'Model not found. Double-check the model name or if it’s still loading.',
      );
    } else {
      throw Exception('Failed to fetch AI response: ${response.body}');
    }
  }
}
