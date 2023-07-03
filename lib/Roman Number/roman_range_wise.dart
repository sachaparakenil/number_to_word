/*import 'package:flutter/material.dart';

class RomanRange extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  const RomanRange(
      {super.key, required this.initialValue, required this.finalValue});

  @override
  State<RomanRange> createState() => _RomanRangeState();
}

class _RomanRangeState extends State<RomanRange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RomanNumberScreen(
          initialValue: widget.initialValue, finalValue: widget.finalValue),
    );
  }
}

class RomanNumberScreen extends StatelessWidget {
  final int initialValue;
  final int finalValue;
  const RomanNumberScreen(
      {super.key, required this.initialValue, required this.finalValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Material(
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
        // onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("ROMAN",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white)),
          Text(" Numbers",
              style: const TextStyle(fontSize: 30, color: Colors.white))
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: ListView.builder(
          itemCount: finalValue,
          itemBuilder: (context, index) {
            final romanNumber = _toRomanNumber(index + initialValue);
            final arabicNumber = index + initialValue;

            final row = index ~/ 2;
            final column = index % 2;

            return Row(
              children: [
                if ((index % 2 == 0))
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          '$arabicNumber - $romanNumber',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                if (column == 0 &&
                    index + 1 <
                        finalValue) // Add the second item in the row if the column is 0 and there is a next item available
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          '${arabicNumber + 1} - ${_toRomanNumber(arabicNumber + 1)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        )),
      ),
    );
  }

  Widget buttonRow(List<String> buttonLabels) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Set the background color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Set a circular border radius
                ),
              ),
              child: Text(
                buttonLabels[0],
                style: TextStyle(
                    color: Colors.black), // Set the text color to black
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Set the background color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Set a circular border radius
                ),
              ),
              child: Text(
                buttonLabels[1],
                style: TextStyle(
                    color: Colors.black), // Set the text color to black
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _toRomanNumber(int number) {
    final List<String> romanNumerals = [
      'I',
      'IV',
      'V',
      'IX',
      'X',
      'XL',
      'L',
      'XC',
      'C',
      'CD',
      'D',
      'CM',
      'M',
      'MM'
    ];
    final List<int> arabicNumbers = [
      1,
      4,
      5,
      9,
      10,
      40,
      50,
      90,
      100,
      400,
      500,
      900,
      1000,
      2000
    ];

    String result = '';
    int index = arabicNumbers.length - 1;

    while (number > 0) {
      if (number >= arabicNumbers[index]) {
        result += romanNumerals[index];
        number -= arabicNumbers[index];
      } else {
        index--;
      }
    }

    return result;
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanRange extends StatefulWidget {
  final int initialValue;
  final int finalValue;

  const RomanRange({
    Key? key,
    required this.initialValue,
    required this.finalValue,
  }) : super(key: key);

  @override
  State<RomanRange> createState() => _RomanRangeState();
}

class _RomanRangeState extends State<RomanRange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RomanNumberScreen(
        initialValue: widget.initialValue,
        finalValue: widget.finalValue,
      ),
    );
  }
}

class RomanNumberScreen extends StatelessWidget {
  final int initialValue;
  final int finalValue;

  const RomanNumberScreen({
    Key? key,
    required this.initialValue,
    required this.finalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Material(
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ROMAN",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              " Numbers",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: ListView.builder(
            itemCount: finalValue,
            itemBuilder: (context, index) {
              final romanNumber = _toRomanNumber(index + initialValue);
              final arabicNumber = index + initialValue;

              final column = index % 2;

              return Row(
                children: [
                  if ((index % 2 == 0))
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _copyToClipboard('$arabicNumber - $romanNumber');
                            /*ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Text copied to clipboard')),
                            );*/
                          },
                          child: ListTile(
                            title: Text(
                              '$arabicNumber - $romanNumber',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (column == 0 &&
                      index + 1 <
                          finalValue)
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _copyToClipboard(
                                '${arabicNumber + 1} - ${_toRomanNumber(arabicNumber + 1)}');
                            /*ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Text copied to clipboard')),
                            );*/
                          },
                          child: ListTile(
                            title: Text(
                              '${arabicNumber + 1} - ${_toRomanNumber(arabicNumber + 1)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buttonRow(List<String> buttonLabels) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                buttonLabels[0],
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                buttonLabels[1],
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _toRomanNumber(int number) {
    final List<String> romanNumerals = [
      'I',
      'IV',
      'V',
      'IX',
      'X',
      'XL',
      'L',
      'XC',
      'C',
      'CD',
      'D',
      'CM',
      'M',
      'MM'
    ];
    final List<int> arabicNumbers = [
      1,
      4,
      5,
      9,
      10,
      40,
      50,
      90,
      100,
      400,
      500,
      900,
      1000,
      2000
    ];

    String result = '';
    int index = arabicNumbers.length - 1;

    while (number > 0) {
      if (number >= arabicNumbers[index]) {
        result += romanNumerals[index];
        number -= arabicNumbers[index];
      } else {
        index--;
      }
    }

    return result;
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
