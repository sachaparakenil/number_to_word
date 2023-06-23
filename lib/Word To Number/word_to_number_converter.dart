import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share/share.dart';
import 'package:speech_to_text/speech_to_text.dart';

class WordToNumberConverterScreen extends StatefulWidget {
  const WordToNumberConverterScreen({super.key});

  @override
  _WordToNumberConverterScreenState createState() =>
      _WordToNumberConverterScreenState();
}

class _WordToNumberConverterScreenState
    extends State<WordToNumberConverterScreen> {
  SpeechToText speechToText = SpeechToText();
  String text = "";
  late FlutterTts flutterTts;
  late final TextEditingController _wordController = TextEditingController();
  var isListening = false;
  String _numberOutput = "";
/*  Map<String, BigInt> wordToNumberMap = {
    'zero': BigInt.from(0),
    'one': BigInt.from(1),
    'two': BigInt.from(2),
    'three': BigInt.from(3),
    'four': BigInt.from(4),
    'five': BigInt.from(5),
    'six': BigInt.from(6),
    'seven': BigInt.from(7),
    'eight': BigInt.from(8),
    'nine': BigInt.from(9),
    'ten': BigInt.from(10),
    'eleven': BigInt.from(11),
    'twelve': BigInt.from(12),
    'thirteen': BigInt.from(13),
    'fourteen': BigInt.from(14),
    'fifteen': BigInt.from(15),
    'sixteen': BigInt.from(16),
    'seventeen': BigInt.from(17),
    'eighteen': BigInt.from(18),
    'nineteen': BigInt.from(19),
    'twenty': BigInt.from(20),
    'thirty': BigInt.from(30),
    'forty': BigInt.from(40),
    'fifty': BigInt.from(50),
    'sixty': BigInt.from(60),
    'seventy': BigInt.from(70),
    'eighty': BigInt.from(80),
    'ninety': BigInt.from(90),
    'hundred': BigInt.from(100),
    'thousand': BigInt.from(1000),
    'million': BigInt.from(1000000),
    'billion': BigInt.from(1000000000),
    'trillion': BigInt.from(1000000000000),
    'quadrillion': BigInt.from(1000000000000000),
    'quintillion': BigInt.from(1000000000000000000),
  };*/

  void convertWordToNumber() {
    String word = _wordController.text.toLowerCase();
    String number = Words2Numbers(word);

    setState(() {
      _numberOutput = number;
    });
  }

  /*String convertLongWordToNumber(String word) {
    List<String> chunks = word.split(' ');
    BigInt number = BigInt.zero;
    chunks.remove("and");

    for (String chunk in chunks) {
      if (wordToNumberMap.containsKey(chunk)) {
      } else {
        return "Invalid input: '$chunk'";
      }
    }

    for (int i = 0; i < chunks.length; i++) {
      if(chunks[i] == "hundred"){
        for(i; i < chunks.length; i++){
          if (chunks[i] == "billion" ||
              chunks[i] == "million" ||
              chunks[i] == "thousand"){
            if(chunks[i-1] == "hundred"){
              number = number + wordToNumberMap[chunks[i-2]]! * wordToNumberMap[chunks[i-1]]!;
            }
            if(chunks[i-2] == "hundred"){
              BigInt? value = wordToNumberMap[chunks[i-3]]! * wordToNumberMap[chunks[i-2]]!;
              number = value + wordToNumberMap[chunks[i-1]]!;
            }
            if(chunks[i-3] == "hundred"){
              BigInt? value = wordToNumberMap[chunks[i-4]]! * wordToNumberMap[chunks[i-3]]!;
              number = value + wordToNumberMap[chunks[i-2]]! + wordToNumberMap[chunks[i-1]]!;
            }
          }
        }
      }
      if (chunks[i] == "billion" ||
          chunks[i] == "million" ||
          chunks[i] == "thousand" ||
          chunks[i] == "hundred") {
        if (i - 2 >= 0) {
          if (chunks[i - 2] == "billion" ||
              chunks[i - 2] == "million" ||
              chunks[i - 2] == "thousand" ||
              chunks[i - 2] == "hundred") {
            number = number +
                (wordToNumberMap[chunks[i - 1]]! * wordToNumberMap[chunks[i]]!);
            print("1  $number");
          } else {
            BigInt? value = wordToNumberMap[chunks[i - 2]]! +
                wordToNumberMap[chunks[i - 1]]!;
            print("2  $value");
            number = number + (value * wordToNumberMap[chunks[i]]!);
            print("3  $number");
          }
        } else {
          number = number +
              (wordToNumberMap[chunks[i - 1]]! * wordToNumberMap[chunks[i]]!);
          print("3  $number");
        }
      } else if (i == chunks.length - 1) {
        if (i - 2 >= 0) {
          if (chunks[i - 2] == "billion" ||
              chunks[i - 2] == "million" ||
              chunks[i - 2] == "thousand" ||
              chunks[i - 2] == "hundred") {
            number = number +
                wordToNumberMap[chunks[i - 1]]! +
                (wordToNumberMap[chunks[i]]!);
          } else {
            number = number + (wordToNumberMap[chunks[i]]!);
          }
        } else {
          if (i - 1 >= 0) {
            number = number +
                (wordToNumberMap[chunks[i - 1]]!) +
                (wordToNumberMap[chunks[i]]!);
          } else {
            number = number + (wordToNumberMap[chunks[i]]!);
          }
        }
      }
    }

    return number.toString();
  }*/


  String Words2Numbers(String string) {
    bool isValidInput = true;
    int result = 0;
    int finalResult = 0;
    List<String> allowedStrings = [
      "zero", "one", "two", "three", "four", "five", "six", "seven",
        "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
        "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
        "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety",
        "hundred", "thousand", "million", "billion", "trillion"];

    String input = string;

    if (string.isNotEmpty) {
      input = input.replaceAll("-", " ");
      input = input.toLowerCase().replaceAll(" and", " ");
      List<String> splittedParts = input.trim().split(" ");

      for (String str in splittedParts) {
        if (!allowedStrings.contains(str)) {
          isValidInput = false;
          // System.out.println("Invalid word found : " + str);
          break;
        }
      }
      if (isValidInput) {
        for (String str in splittedParts) {
          if (str == "zero") {
            result += 0;
          } else if (str == ("one")) {
            result += 1;
          } else if (str == ("two")) {
            result += 2;
          } else if (str == ("three")) {
            result += 3;
          } else if (str == ("four")) {
            result += 4;
          } else if (str == ("five")) {
            result += 5;
          } else if (str == ("six")) {
            result += 6;
          } else if (str == ("seven")) {
            result += 7;
          } else if (str == ("eight")) {
            result += 8;
          } else if (str == ("nine")) {
            result += 9;
          } else if (str == ("ten")) {
            result += 10;
          } else if (str == ("eleven")) {
            result += 11;
          } else if (str == ("twelve")) {
            result += 12;
          } else if (str == ("thirteen")) {
            result += 13;
          } else if (str == ("fourteen")) {
            result += 14;
          } else if (str == ("fifteen")) {
            result += 15;
          } else if (str == ("sixteen")) {
            result += 16;
          } else if (str == ("seventeen")) {
            result += 17;
          } else if (str == ("eighteen")) {
            result += 18;
          } else if (str == ("nineteen")) {
            result += 19;
          } else if (str == ("twenty")) {
            result += 20;
          } else if (str == ("thirty")) {
            result += 30;
          } else if (str == ("forty")) {
            result += 40;
          } else if (str == ("fifty")) {
            result += 50;
          } else if (str == ("sixty")) {
            result += 60;
          } else if (str == ("seventy")) {
            result += 70;
          } else if (str == ("eighty")) {
            result += 80;
          } else if (str == ("ninety")) {
            result += 90;
          } else if (str == "hundred") {
            result *= 100;
          } else if (str == ("thousand")) {
            result *= 1000;
            finalResult += result;
            result = 0;
          } else if (str == ("million")) {
            result *= 1000000;
            finalResult += result;
            result = 0;
          } else if (str == ("billion")) {
            result *= 1000000000;
            finalResult += result;
            result = 0;
          } else if (str == ("trillion")) {
            result *= 1000000000000;
            finalResult += result;
            result = 0;
          }
        }

        finalResult += result;
        result = 0;
        // System.out.println(finalResult);

        print("preCheck --> $finalResult");
      }
    }
    print("$finalResult");
    return finalResult.toString();
    // return String.valueOf((finalResult));
  }


  void share() {
    String textToShare =
        'Word: ${_wordController.text}\nNumber: $_numberOutput';
    Share.share(textToShare);
  }

  void copy() {
    String textToCopy = 'Word: ${_wordController.text}\nNumber: $_numberOutput';
    Clipboard.setData(ClipboardData(text: textToCopy));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  void clear() {
    setState(() {
      _wordController.clear();
      _numberOutput = (BigInt.zero).toString();
    });
  }

  void speak(int number) async {
    flutterTts = FlutterTts();
    flutterTts.setVolume(0.5);
    flutterTts.setLanguage("en-US");
    await flutterTts.speak(number.toString());
  }

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word to Number Converter'),
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
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                      _wordController.text = text;
                    });
                  });
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
              controller: _wordController,
              decoration: const InputDecoration(
                hintText: 'Word',
                labelText: 'Enter a word',
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Number: $_numberOutput',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertWordToNumber,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Tooltip(
                    message: "Share",
                    child: ElevatedButton(
                      onPressed: share,
                      child: const Icon(Icons.share),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Tooltip(
                    message: "Copy",
                    child: ElevatedButton(
                      onPressed: copy,
                      child: const Icon(Icons.copy_all),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Tooltip(
                    message: "Clear",
                    child: ElevatedButton(
                      onPressed: clear,
                      child: const Icon(Icons.layers_clear),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Tooltip(
                    message: "Speak",
                    child: ElevatedButton(
                      onPressed: () => speak(int.parse(_numberOutput)),
                      child: const Icon(Icons.record_voice_over_rounded),
                    ),
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