import 'package:flutter/material.dart';
import 'package:number_to_word/NumberSpelling/number_spellings.dart';
import 'package:number_to_word/Roman%20Number/roman_numbers.dart';
import 'package:number_to_word/Word%20To%20Number/word_to_number_converter.dart';
import '../Even Odd/even_odd_numbers.dart';
import '../NumberSpelling/one_to_ten.dart';
import 'package:number_to_word/Home/splash.dart';
import 'home_screen.dart';
import '../Number To Word/number_to_word_converter.dart';
import '../One Two Three/one_two_three.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/romanNumbers': (context) => MyButtonColumn(),
        '/evenOddNumber': (context) => const EvenOddNumber(),
        '/onetwothree': (context) => const OneTwoThreeScreen(),
        '/Numberspellings': (context) => const NumberSpellings(),
        '/oneToten': (context) => const OneToTen(),
      },
    );
  }
}
