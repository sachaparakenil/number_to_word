import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _validate = false;
  final FocusNode _focusNode = FocusNode();
  late FlutterTts flutterTts;
  late final TextEditingController _wordController = TextEditingController();
  var isListening = false;
  String _numberOutput = "";

  String? get _invalid {
    final text = _wordController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty!';
    }
    if (text.contains(".")) {
      return 'Can\'t Contain Point!';
    }
    if (text.contains(RegExp(r'[0-9]'))) {
      return "Can\'t Contain Number!";
    }
    return " ";
  }

  void convertWordToNumber() {
    String word = _wordController.text.toLowerCase();
    String number = Words2Numbers(word);

    setState(() {
      _numberOutput = number;
    });
    if (_validate) {
      if (!(_invalid == " ")) {
        print("Alert box");
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
                      _invalid ?? 'Unknown error',
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

  String Words2Numbers(String string) {
    bool isValidInput = true;
    int result = 0;
    int finalResult = 0;
    List<String> allowedStrings = [
      "zero",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "eleven",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen",
      "twenty",
      "thirty",
      "forty",
      "fifty",
      "sixty",
      "seventy",
      "eighty",
      "ninety",
      "hundred",
      "thousand",
      "million",
      "billion",
      "trillion"
    ];

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
      }
    }
    return finalResult.toString();
  }

  void share() {
    String textToShare =
        'Word: ${_wordController.text}\nNumber: $_numberOutput';
    Share.share(textToShare);
  }

  void copy() {
    String textToCopy = 'Word: ${_wordController.text}\nNumber: $_numberOutput';
    Clipboard.setData(ClipboardData(text: textToCopy));

    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );*/
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
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          child: Container(
                            height: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("WORD TO NUMBER",
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
                                'Enter a Word',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ),
                              TextField(
                                focusNode: _focusNode,
                                controller: _wordController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter a here',
                                  hintStyle: TextStyle(fontSize: 20, color: Colors.black54),
                                ),
                                onChanged: (text) =>
                                    setState(() => _wordController),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(60),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Your Answer is",
                                        style: TextStyle(fontSize: 18, color: Colors.black,)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _numberOutput,
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
                          padding: const EdgeInsets.only(right: 65.0, top: 85),
                          child: IconButton(
                            icon: Image.asset('assets/images/convert_btn.png'),
                            iconSize: 80,
                            onPressed: () {
                              setState(() {
                                _invalid!.isEmpty
                                    ? _validate = false
                                    : _validate = true;
                                // _numberController.text.contains(" ") ? _validate = true : _validate = false;
                              });
                              _validate ? convertWordToNumber() : null;
                            },
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
                                          onPressed: share,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                          child: Image.asset(
                                              'assets/images/share.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Flexible(
                                        child: ElevatedButton(
                                          onPressed: copy,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                          child: Image.asset(
                                              'assets/images/copy.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Flexible(
                                        child: ElevatedButton(
                                          onPressed: clear,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                          child: Image.asset(
                                              'assets/images/clear.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Flexible(
                                          child: ElevatedButton(
                                        onPressed: () =>
                                            speak(int.parse(_numberOutput)),
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
      ),
    );
  }
}
