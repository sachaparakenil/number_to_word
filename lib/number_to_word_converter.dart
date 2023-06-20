import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share/share.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NumberToWordConverterScreen extends StatefulWidget {
  const NumberToWordConverterScreen({super.key});

  @override
  _NumberToWordConverterScreenState createState() =>
      _NumberToWordConverterScreenState();
}

class _NumberToWordConverterScreenState
    extends State<NumberToWordConverterScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _convertedWord = '';
  SpeechToText speechToText = SpeechToText();
  String text = "";
  var isListening = false;
  late FlutterTts flutterTts;

  final Map<int, String> _numberWordMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
    20: 'twenty',
    30: 'thirty',
    40: 'forty',
    50: 'fifty',
    60: 'sixty',
    70: 'seventy',
    80: 'eighty',
    90: 'ninety',
  };

  final List<String> _numberScale = [
    '', // One's place
    'thousand',
    'million',
    'billion',
    'trillion',
    'quadrillion',
    'quintillion',
    'sextillion',
    'septillion',
    'octillion',
    'nonillion',
    'decillion',
    // Add more scales as needed
  ];

  void _convertNumberToWord() {
    String number = _numberController.text.trim();
    int parsedNumber = int.tryParse(number) ?? 0;

    String convertedWord = '';

    if (parsedNumber == 0) {
      convertedWord = _numberWordMap[parsedNumber] ?? '';
    } else {
      int scaleIndex = 0;

      while (parsedNumber > 0) {
        if (parsedNumber % 1000 != 0) {
          String partialWord = _convertThreeDigitNumber(parsedNumber % 1000);

          if (scaleIndex > 0) {
            partialWord += ' ${_numberScale[scaleIndex]}';
          }

          if (convertedWord.isEmpty) {
            convertedWord = partialWord;
          } else {
            convertedWord = '$partialWord, $convertedWord';
          }
        }

        parsedNumber ~/= 1000;
        scaleIndex++;
      }
    }

    setState(() {
      _convertedWord = 'Converted Word: $convertedWord';
    });
  }

  String _convertThreeDigitNumber(int number) {
    String word = '';

    int hundreds = number ~/ 100;
    int tens = (number ~/ 10) % 10;
    int ones = number % 10;

    if (hundreds > 0) {
      word += '${_numberWordMap[hundreds]} hundred';

      if (tens > 0 || ones > 0) {
        word += ' and ';
      }
    }

    if (tens > 0) {
      if (tens == 1) {
        word += _numberWordMap[tens * 10 + ones]!;
      } else {
        word += _numberWordMap[tens * 10]!;

        if (ones > 0) {
          word += '-${_numberWordMap[ones]}';
        }
      }
    } else if (ones > 0) {
      word += _numberWordMap[ones]!;
    }

    return word;
  }

  void _clearInput() {
    _numberController.clear();
    setState(() {
      _convertedWord = '';
    });
  }

  void _copyToClipboard() {
    String textToCopy =
        'Number: ${_numberController.text}\nWord: $_convertedWord';
    Clipboard.setData(ClipboardData(text: textToCopy));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  void _shareNumberAndWord() {
    Share.share('Number: ${_numberController.text}\nWord: $_convertedWord');
  }

  void speak(String value) async {
    await flutterTts.speak((value).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number to Word Converter'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.black,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async{
            if(!isListening){
              var available = await speechToText.initialize();
              if(available){
                setState(() {
                  isListening = true;
                  speechToText.listen(
                      onResult: (result){
                        setState(() {
                          text = result.recognizedWords;
                          _numberController.text = text;
                        });
                      }
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 35,
            child: Icon(isListening ? Icons.mic : Icons.mic_none,
                color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Number',
                labelText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertNumberToWord,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16.0),
            Text(_convertedWord),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _shareNumberAndWord,
                    child: const Icon(Icons.share),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearInput,
                    child: const Icon(Icons.layers_clear_sharp),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _copyToClipboard,
                    child: const Icon(Icons.copy_all_outlined),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _NumberToWordConverterScreenState().speak(_convertedWord),
                    child: const Icon(Icons.record_voice_over_rounded),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
