import 'package:flutter/material.dart';
import 'package:number_to_word/NumberSpelling/dynamic_speaker.dart';

class NumberSpellings extends StatelessWidget {
  const NumberSpellings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Number Spellings"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 0, finalValue: 10, showInt: 0, currentInt: -1)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('     0 - 10 \n ZERO - TEN'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 11, finalValue: 20, showInt: 11, currentInt: 10)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: Title(color: Colors.blue,
                  child: const Text('           11 - 20 \n ELEVEN - TWENTY')),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 21, finalValue: 30, showInt: 21, currentInt: 20)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('               21 - 30 \n TWENTY ONE - THIRTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 31, finalValue: 40, showInt: 31, currentInt: 30)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('              31 - 40 \n THIRTY ONE - FORTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 41, finalValue: 50, showInt: 41, currentInt: 40)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('            41 - 50 \n FORTY ONE - FIFTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 51, finalValue: 60, showInt: 51, currentInt: 50)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('           51 - 60 \n FIFTY ONE - SIXTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 61, finalValue: 70, showInt: 61, currentInt: 60)));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),),
                  child: const Text('              61 - 70 \n SIXTY ONE - SEVENTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 71, finalValue: 80, showInt: 71, currentInt: 70)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: const Text('               71 - 80 \n SEVENTY ONE - EIGHTY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 81, finalValue: 90, showInt: 81, currentInt: 80)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: const Text('              81 - 90 \n EIGHTY ONE - NINETY'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 91, finalValue: 100, showInt: 91, currentInt: 90)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: const Text('                    91 - 100 \n NINETY ONE - ONE HUNDRED'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 0, finalValue: 100, showInt: 0, currentInt: -1)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: const Text('              0 - 100 \n ZERO - ONE HUNDRED'),
                ),
              ),const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
