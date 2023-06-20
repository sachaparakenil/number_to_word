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
  Map<String, BigInt> wordToNumberMap = {
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
  };



  void convertWordToNumber() {
    String word = _wordController.text.toLowerCase();
    String number = convertLongWordToNumber(word);

    setState(() {
      _numberOutput = number;
    });
  }

  String convertLongWordToNumber(String word) {
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
      if (chunks[i] == "billion" ||
          chunks[i] == "million" ||
          chunks[i] == "thousand" ||
          chunks[i] == "hundred" ||
          chunks[i] == "trillion" ||
          chunks[i] == "quadrillion" ||
          chunks[i] == "quintillion") {
        if (i - 2 >= 0) {
          if (chunks[i - 2] == "billion" ||
              chunks[i - 2] == "million" ||
              chunks[i - 2] == "thousand" ||
              chunks[i - 2] == "hundred" ||
              chunks[i] == "trillion" ||
              chunks[i] == "quadrillion" ||
              chunks[i] == "quintillion") {
            number = number +
                (wordToNumberMap[chunks[i - 1]]! * wordToNumberMap[chunks[i]]!);
          } else {
            BigInt? value = wordToNumberMap[chunks[i - 2]]! +
                wordToNumberMap[chunks[i - 1]]!;
            number = number + (value * wordToNumberMap[chunks[i]]!);
          }
        } else {
          number = number +
              (wordToNumberMap[chunks[i - 1]]! * wordToNumberMap[chunks[i]]!);
        }
      } else if (i == chunks.length - 1) {
        if (i - 2 >= 0) {
          if (chunks[i - 2] == "billion" ||
              chunks[i - 2] == "million" ||
              chunks[i - 2] == "thousand" ||
              chunks[i - 2] == "hundred" ||
              chunks[i] == "trillion" ||
              chunks[i] == "quadrillion" ||
              chunks[i] == "quintillion") {
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
    await flutterTts.speak((number).toString());
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
                        _wordController.text = text;
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
              controller: _wordController,
              decoration: const InputDecoration (
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
                  child: ElevatedButton(
                    onPressed: share,
                    child: const Icon(Icons.share),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: copy,
                    child: const Icon(Icons.copy_all),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: clear,
                    child: const Icon(Icons.layers_clear),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _WordToNumberConverterScreenState().speak(_numberOutput as int),
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
