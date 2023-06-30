import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Roman Numbers'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: finalValue,
          itemBuilder: (context, index) {
            final romanNumber = _toRomanNumber(index + initialValue);
            final arabicNumber = index + initialValue;
            return Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Number: $arabicNumber',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      romanNumber,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            );
          },
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
                backgroundColor: Colors.white, // Set the background color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set a circular border radius
                ),
              ),
              child: Text(
                buttonLabels[0],
                style: TextStyle(color: Colors.black), // Set the text color to black
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
                backgroundColor: Colors.white, // Set the background color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set a circular border radius
                ),
              ),
              child: Text(
                buttonLabels[1],
                style: TextStyle(color: Colors.black), // Set the text color to black
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
}
