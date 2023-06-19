import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  TextToSpeech({super.key});

  @override
  Widget build(BuildContext context) {
    speak(String text) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.8);
      await flutterTts.speak(text);
    }

    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(onPressed: () => speak(textEditingController.text),
                child: const Text("Start To speech")),
          ],
        ),
      ),
    );
  }
}