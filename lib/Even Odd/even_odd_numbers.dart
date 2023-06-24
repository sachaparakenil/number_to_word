import 'package:flutter/material.dart';
import 'package:number_to_word/Even%20Odd/even_number.dart';

class EvenOddNumber extends StatelessWidget {
  const EvenOddNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Even Odd Number Pronouncer"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EvenOdd(initialValue: 1, finalValue: 100, showInt: 2, currentNumber: 0,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: const Text('Even Numbers'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EvenOdd(initialValue: 0, finalValue: 99, showInt: 1, currentNumber: -1,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                  child: Title(color: Colors.blue,
                      child: const Text('Odd Numbers')),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

