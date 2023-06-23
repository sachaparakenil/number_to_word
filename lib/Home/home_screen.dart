import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Number To Word Converter App')),
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
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('Number to Word Converter'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/wordToNumber');
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('Word to Number Converter'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/evenOddNumber');
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('Even Odd Number'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/romanNumbers');
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('Roman Numbers'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onetwothree');
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('One Two Three'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Numberspellings');
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text('Number Spellings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
