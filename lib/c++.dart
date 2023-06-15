// import 'dart:core';
// import 'dart:collection';
// import 'dart:math';
// import 'dart:convert';
//
// class Converter {
//   static String translate(String input) =>
//       _convertToNumbers(input)
//           .fold("", (current, word) => current + (word + " "))
//           .trimRight();
//
//   static List<String> _convertToNumbers(String words) {
//     if (words == null || words.isEmpty) {
//       return [];
//     }
//
//     int signatureFlag;
//     var matches = RegExp(r'\w+').allMatches(words).toList();
//     var lowerCases = matches.map((m) => m.group(0)!.toLowerCase()).toList();
//     var isConvertable = lowerCases.map((l) => _numbers.containsKey(l)).toList();
//     var list = <String>[];
//     var sentence = <String>[];
//     for (var index = 0; index < isConvertable.length; index++) {
//       var token = isConvertable[index];
//       if (token) {
//         list.add(lowerCases[index]);
//       } else {
//         if (list.isNotEmpty) {
//           signatureFlag = list.first == "minus" ? -1 : 1;
//           sentence.add(_getDigits(list.map((n) => _numbers[n]!), signatureFlag).toString());
//           list = [];
//         }
//
//         sentence.add(matches[index].group(0)!);
//       }
//     }
//
//     if (list.isEmpty || sentence.isNotEmpty) {
//       return sentence;
//     }
//
//     signatureFlag = list.first == "minus" ? -1 : 1;
//     sentence.add(_getDigits(list.map((n) => _numbers[n]!), signatureFlag).toString());
//
//     return sentence;
//   }
//
//   static int _getDigits(Iterable<int> numbers, [int signatureFlag = 1]) {
//     var percentile = 0;
//     var result = 0;
//     for (var number in numbers) {
//       switch (number) {
//         case int.parse("1000") <= number:
//           result += percentile * number;
//           percentile = 0;
//           break;
//         case int.parse("100") <= number:
//           percentile *= number;
//           break;
//         default:
//           percentile += number;
//           break;
//       }
//     }
//
//     return (result + percentile) * signatureFlag;
//   }
//
//   static final Map<String, int> _numbers = {
//     "zero": 0,
//     "one": 1,
//     "two": 2,
//     "three": 3,
//     "four": 4,
//     "five": 5,
//     "six": 6,
//     "seven": 7,
//     "eight": 8,
//     "nine": 9,
//     "ten": 10,
//     "eleven": 11,
//     "twelve": 12,
//     "thirteen": 13,
//     "fourteen": 14,
//     "fifteen": 15,
//     "sixteen": 16,
//     "seventeen": 17,
//     "eighteen": 18,
//     "nineteen": 19,
//     "twenty": 20,
//     "thirty": 30,
//     "forty": 40,
//     "fifty": 50,
//     "sixty": 60,
//     "seventy": 70,
//     "eighty": 80,
//     "ninety": 90,
//     "hundred": 100,
//     "thousand": 1000,
//     "million": 1000000,
//     "billion": 1000000000,
//     "trillion": 1000000000000,
//     "quadrillion": 1000000000000000,
//     "quintillion": 1000000000000000000
//   };
// }