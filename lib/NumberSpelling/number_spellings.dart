import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_to_word/NumberSpelling/dynamic_speaker.dart';

class NumberSpellings extends StatelessWidget {
  const NumberSpellings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/back.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        ),
        // onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 16.0),
                      SafeArea(
                        child: Container(
                          height: 90,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ROMAN",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white)),
                                Text(" Numbers",
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white))
                              ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 0, finalValue: 10, showInt: 0, currentInt: -1)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '0 - 10',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'ZERO - TEN',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 11, finalValue: 20, showInt: 11, currentInt: 10)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '11 - 20',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'ELEVEN - TWENTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 21, finalValue: 30, showInt: 21, currentInt: 20)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '21 -30',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'TWENTY ONE - THIRTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 31, finalValue: 40, showInt: 31, currentInt: 30)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '31 - 40',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'THIRTY ONE - FORTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 41, finalValue: 50, showInt: 41, currentInt: 40)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '41 - 50',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'FORTY ONE - FIFTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 51, finalValue: 60, showInt: 51, currentInt: 50)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '51 - 60',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'FIFTY ONE - SIXTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 61, finalValue: 70, showInt: 61, currentInt: 60)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '61 - 70',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'SIXTY ONE - SEVENTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 71, finalValue: 80, showInt: 71, currentInt: 70)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '71 - 80',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'SEVENTY ONE - EIGHTY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 81, finalValue: 90, showInt: 81, currentInt: 80)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '81 - 90',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'EIGHTY ONE - NINETY',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 91, finalValue: 100, showInt: 91, currentInt: 90)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '91 - 100',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'NINETY ONE - HUNDRED',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 0, finalValue: 100, showInt: 0, currentInt: -1)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '0 - 100',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'ZERO - ONE HUNDRED',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                          fontSize: 9
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicSpeaker(initialValue: 11, finalValue: 20, showInt: 11, currentInt: 10)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // Set the background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set a circular border radius
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    'Number',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Spellings',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  /*Center(
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
                  ),*/
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
