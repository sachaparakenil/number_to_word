import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

void main() {
  runApp(const NumberToWordConverterApp());
}

class NumberToWordConverterApp extends StatelessWidget {
  const NumberToWordConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number to Word Converter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //   primarySwatch: Colors.deepPurple,
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/numberToWord': (context) => const NumberToWordConverterScreen(),
        '/wordToNumber': (context) => const WordToNumberScreen()
      },
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    // fit: BoxFit.scaleDown,
                    image: AssetImage("./assets/images/navigation.png"),
                  ),
                ),
                child: Text('Number To Word'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title: const Text('Settings'),
                onTap: () async {
                  // await here
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _NextView()),
                  );
                  // call pop
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.share,
                ),
                title: const Text('Share'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.rate_review_outlined,
                ),
                title: const Text('Rate Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),// Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/numberToWord');
                },
                child: const Text('Number to Word Converter'),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/wordToNumber');
                },
                child: const Text('Word to Number Converter'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Setting"),
        ),
      ),
    );
  }
}


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
    Clipboard.setData(ClipboardData(text: _convertedWord));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

void _shareNumberAndWord() {
  Share.share('Number: ${_numberController.text}\nWord: $_convertedWord');
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Number to Word Converter'),
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
                  onPressed: _clearInput,
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: _shareNumberAndWord,
                  child: const Text('Share'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: _copyToClipboard,
                  child: const Text('Copy'),
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

class WordToNumberApp extends StatelessWidget {
  const WordToNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word to Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WordToNumberScreen(),
    );
  }
}

class WordToNumberScreen extends StatefulWidget {
  const WordToNumberScreen({super.key});

  @override
  _WordToNumberScreenState createState() => _WordToNumberScreenState();
}

class _WordToNumberScreenState extends State<WordToNumberScreen> {
  final TextEditingController _wordController = TextEditingController();
  int _numberOutput = 0;
  Map<String, int> wordToNumberMap = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19,
    'twenty': 20,
    'thirty': 30,
    'forty': 40,
    'fifty': 50,
    'sixty': 60,
    'seventy': 70,
    'eighty': 80,
    'ninety': 90,
    'hundred': 100,
    'thousand': 1000,
    'million': 1000000,
    'billion': 1000000000,
    'trillion': 1000000000000,
    'quadrillion': 1000000000000000,
    'quintillion': 1000000000000000000,
  };

  void convertWordToNumber() {
    String word = _wordController.text.toLowerCase();
    int number = convertLongWordToNumber(word);

    setState(() {
      _numberOutput = number;
    });
  }

  int convertLongWordToNumber(String word) {
    List<String> chunks = word.split(' ');
    int number = 0;
    int currentNumber = 0;
    bool hasHundred = false;

    for (String chunk in chunks) {
      if (wordToNumberMap.containsKey(chunk)) {
        int value = wordToNumberMap[chunk]!;
        if (value >= 100) {
          hasHundred = true;
          currentNumber *= value;
        } else {
          currentNumber += value;
        }
      } else {
        if (chunk == 'and') {
          continue;
        } else if (chunk == 'hundred') {
          currentNumber *= 100;
          hasHundred = true;
        } else {
          number += currentNumber;
          currentNumber = 0;

          if (hasHundred) {
            number *= 100;
            hasHundred = false;
          }

          if (wordToNumberMap.containsKey(chunk)) {
            currentNumber = wordToNumberMap[chunk]!;
          }
        }
      }
    }

    number += currentNumber;
    return number;
  }

  void share() {
    String textToShare = 'Word: ${_wordController.text}\nNumber: $_numberOutput';
    Share.share(textToShare);
  }

  void copy() {
    String textToCopy = '${_wordController.text} - $_numberOutput';
    Clipboard.setData(ClipboardData(text: textToCopy));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  void clear() {
    setState(() {
      _wordController.clear();
      _numberOutput = 0;
    });
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
        title: const Text('Word to Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _wordController,
              decoration: const InputDecoration(
                labelText: 'Word',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertWordToNumber,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Number: $_numberOutput',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: share,
                    child: const Text('Share'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: copy,
                    child: const Text('Copy'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: clear,
                    child: const Text('Clear'),
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