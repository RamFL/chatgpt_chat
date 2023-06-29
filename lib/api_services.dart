import 'dart:convert';
import 'package:http/http.dart' as http;



String apiKey = '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';

class ApiServices {
  static String baseUrl = 'https://api.openai.com/v1/completions';

  static Map<String, String> header = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey",
  };

  static sendMessage(String? message) async {
    var res = await http.post(Uri.parse(baseUrl),
    headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": "$message",
        "max_tokens": 100,
        "temperature": 0,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["Human:", "AI:"]
      }),
    );

    print(res.body);

    if(res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var msg = data["choices"][0]["text"];

      print("I am ChatBot :- $msg");
      return msg;
    }else {
      print("Failed to fetch data");
    }

  }

}