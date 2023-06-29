

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {

  static FlutterTts tts = FlutterTts();

  static initTTS () async{

    print(await tts.getLanguages);

    tts.setLanguage("en-US");
    tts.setPitch(1.0);
  }

  static speak (String text) async{

    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
  }

}