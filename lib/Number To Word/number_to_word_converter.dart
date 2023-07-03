import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NumberToWordConverterScreen extends StatefulWidget {
  const NumberToWordConverterScreen({Key? key}) : super(key: key);

  @override
  _NumberToWordConverterScreenState createState() =>
      _NumberToWordConverterScreenState();
}

class _NumberToWordConverterScreenState
    extends State<NumberToWordConverterScreen> {
  final TextEditingController _numberController = TextEditingController();
  bool _validate = false;
  String _convertedWord = '';
  SpeechToText speechToText = SpeechToText();
  String text = "";
  var isListening = false;
  late FlutterTts flutterTts;

  String? get _errorText {
    final text = _numberController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty!';
    }
    if (text.contains(" ")) {
      return 'Can\'t Contain Space!';
    }
    if (text.contains(".")) {
      return 'Can\'t Contain Point!';
    }
    if (text.contains("-")) {
      return 'Can\'t Contain Hyphen!';
    }
    if (text.contains(RegExp(r'[a-z]'))) {
      return "Can\'t Contain Word!";
    }
    if (!(text == "zero")) {
      if (_convertedWord == "0") {
        return "Unknown Error";
      }
    }
    // return null if the text is valid
    return " ";
  }

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
      _convertedWord = convertedWord;
    });
    if (_validate) {
      if (!(_errorText == " ")) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Center(child: Text('ERROR')),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              content: Container(
                height: 155,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 80.0,
                      icon: Image.asset(
                        'assets/images/att.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      _errorText ?? 'Unknown error',
                      style: TextStyle(
                          color: Colors.red, // Set the text color
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold // Set the font size
                          ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
        return;
      }
    }
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
    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );*/
  }

  void _shareNumberAndWord() {
    Share.share('Number: ${_numberController.text}\nWord: $_convertedWord');
  }

  void speak(int number) async {
    flutterTts = FlutterTts();
    flutterTts.setVolume(0.5);
    flutterTts.setLanguage("en-US");
    await flutterTts.speak(number.toString());
  }

  @override
  Widget build(BuildContext context) {
    /*final double appBarHeight = AppBar().preferredSize.height;
    final double topSpacing = 50.0;*/

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/images/back.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          // onPressed: () => Navigator.of(context).pop(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(''),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 16.0),
                        SafeArea(
                          child: Container(
                            height: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("NUMBER TO WORD",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white)),
                                  Text("Converter",
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white))
                                ]),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Enter a Number',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                TextField(
                                  controller: _numberController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Enter here',
                                    hintStyle: TextStyle(fontSize: 20),
                                  ),
                                  onChanged: (text) => setState(() {}),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110.0),
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(60),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 4),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Your Answer is",
                                          style: TextStyle(fontSize: 18)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          _convertedWord,
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 65.0, top: 90),
                            child: IconButton(
                              icon:
                                  Image.asset('assets/images/convert_btn.png'),
                              iconSize: 80,
                              onPressed: () {
                                setState(() {
                                  _errorText!.isEmpty
                                      ? _validate = false
                                      : _validate = true;
                                  // _numberController.text.contains(" ") ? _validate = true : _validate = false;
                                });
                                _validate ? _convertNumberToWord() : null;
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 60.5),
                            child: AvatarGlow(
                              endRadius: 30,
                              animate: isListening,
                              duration: const Duration(milliseconds: 2000),
                              glowColor: Colors.black,
                              repeat: true,
                              repeatPauseDuration:
                                  const Duration(milliseconds: 100),
                              showTwoGlows: true,
                              child: GestureDetector(
                                onTapDown: (details) async {
                                  if (!isListening) {
                                    var available =
                                        await speechToText.initialize();
                                    if (available) {
                                      setState(() {
                                        isListening = true;
                                        speechToText.listen(onResult: (result) {
                                          setState(() {
                                            text = result.recognizedWords;
                                            _numberController.text =
                                                text.trim();
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
                                  backgroundColor:
                                      Color.fromRGBO(30, 66, 200, 1),
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon:
                                          Image.asset("assets/images/mic.png")),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80.0, left: 80.0),
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                // width: 256,
                                height: 65,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: ElevatedButton(
                                            onPressed: _shareNumberAndWord,
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Colors.transparent),
                                            ),
                                            child: Image.asset(
                                                'assets/images/share.png',
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Flexible(
                                          child: ElevatedButton(
                                            onPressed: _copyToClipboard,
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Colors.transparent),
                                            ),
                                            child: Image.asset(
                                                'assets/images/copy.png',
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Flexible(
                                          child: ElevatedButton(
                                            onPressed: _clearInput,
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Colors.transparent),
                                            ),
                                            child: Image.asset(
                                                'assets/images/clear.png',
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Flexible(
                                            child: ElevatedButton(
                                          onPressed: () => speak(int.parse(
                                              _numberController.text)),
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor:
                                                Color.fromRGBO(255, 171, 0, 1),
                                            fixedSize: const Size(45, 45),
                                          ),
                                          child: Image.asset(
                                            'assets/images/speak.png',
                                            // fit: BoxFit.contain,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
