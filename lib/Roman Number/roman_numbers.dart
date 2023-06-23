import 'package:flutter/material.dart';
import 'package:number_to_word/Roman%20Number/roman_range_wise.dart';

class RomanNumbers extends StatelessWidget {
  const RomanNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Roman Numbers"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1 TO 200'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 201, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: Title(
                    color: Colors.blue,
                    child: const Text('201 TO 400'),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 401, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('401 TO 600'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 601, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('601 TO 800'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 801, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('801 TO 1000'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1001, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1001 TO 1200'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1201, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1201 TO 1400'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1401, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1401 TO 1600'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1601, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1601 TO 1800'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const RomanRange(initialValue: 1801, finalValue: 200,)));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                  ),
                  child: const Text('1801 TO 2000'),
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
