import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as dev;

final List<Map<String, String>> messages = [];
const String openAiKey =
    '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';

const String openAiKey1 =
    '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';
const String openAiKey2 =
    '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';
const String openAiKey3 =
    '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';

const String prompt = """
"Benarkah kode PHP ini berfungsi dengan benar untuk mengambil semua data submission?

PHP
public function getAllSubmission()
 {
     \$submissions = SubmissionTask::all();
     return response()->json([
         'data' => SubmissionResource::collection(\$submissions)
     ], 200);
 }
Use code with caution.

Jawab dengan 'true' atau 'false'."
""";

Future<String> chatGPTAPI() async {
  messages.add({
    'role': 'user',
    'content': prompt,
  });
  try {
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openAiKey3',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
      }),
    );

    dev.log(name: 'response status code', res.statusCode.toString());
    dev.log(name: 'response status code', res.body.toString());

    if (res.statusCode == 200) {
      String content = jsonDecode(res.body)['choices'][0]['message']['content'];
      content = content.trim();
      dev.log(name: 'response status code', content.toString());

      messages.add({
        'role': 'assistant',
        'content': content,
      });
      return content;
    }
    return 'An internal error occurred';
  } catch (e) {
    return e.toString();
  }
}
