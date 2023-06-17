import 'package:flutter/material.dart';
import 'package:number_to_word/word_to_number_converter.dart';
import 'home_screen.dart';
import 'number_to_word_converter.dart';
import 'one_two_three.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number to Word Converter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //   primarySwatch: Colors.deepPurple,
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/numberToWord': (context) => const NumberToWordConverterScreen(),
        '/wordToNumber': (context) => const WordToNumberConverterScreen(),
        '/onetwothree': (context) => OneTwoThreeScreen()
      },
    );
  }
}
