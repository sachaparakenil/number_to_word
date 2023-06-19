import 'package:flutter/material.dart';

void main() {
  runApp(const NumberSpellings());
}

class NumberSpellings extends StatelessWidget {
  const NumberSpellings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Number Spellings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/oneToten');
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),),
                child: const Text('One To Ten'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
