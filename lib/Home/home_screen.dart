import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;
    final double topSpacing = 80.0; // Adjust the value as per your requirement

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 40.0,right: 16.0,bottom: 0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/title.png',
                fit: BoxFit.contain,
                height: 45.0,
              ),
              const Spacer(),
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      // Add functionality for the no_ad.png
                    },
                    icon: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/no_ad.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      // Add functionality for the info.png
                    },
                    icon: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 1.0,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/info.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            // width: double.infinity,
            // height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: appBarHeight + topSpacing),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/numberToWord');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/numbers_word.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Number to',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Word',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/wordToNumber');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/word_numbers.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Word to',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/evenOddNumber');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/odd_even.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Even Odd',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
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
                  ),
                  // const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/romanNumbers');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/roman_digit.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Roman',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Numbers',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/onetwothree');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/numbers.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'One Two',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Three',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Numberspellings');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromRGBO(16,20,50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(16,20,50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(image: AssetImage("assets/images/spellings.png", ),
                                        width: 24,
                                        height: 24,),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Spellings',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
