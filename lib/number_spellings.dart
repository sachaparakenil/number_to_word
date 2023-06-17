import 'package:flutter/material.dart';

void main() {
  runApp(const NumberSpellings());
}

class NumberSpellings extends StatelessWidget {
  const NumberSpellings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Spellings"),
      ),
    );
  }
}
