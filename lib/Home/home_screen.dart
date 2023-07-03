import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = AppBar().preferredSize.height;
    final double topSpacing = 40.0; // Adjust the value as per your requirement

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 40.0, right: 16.0, bottom: 0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/title.png',
                fit: BoxFit.contain,
                height: 45.0,
              ),
              const Spacer(),
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/no_ad.png',
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        // Handle button tap
                      },
                    ),
                  ],
                ),
              ),

              Container(
                // margin: EdgeInsets.only(right: 10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.greenAccent,
                        /*border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),*/
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/info.png',
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        // Handle button tap
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 8, bottom: 0),
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
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/numbers_word.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'to Word',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 8, bottom: 0),
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
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/word_numbers.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 8, bottom: 0),
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
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/odd_even.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 4, bottom: 8),
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
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/roman_digit.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Number',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 4, bottom: 8),
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
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/numbers.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Three',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 4, bottom: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Numberspellings');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 15,bottom: 15, right: 7,left: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            const Color.fromRGBO(16, 20, 50, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              16, 20, 50, 1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/spellings.png",
                                        ),
                                        width: 35,
                                        height: 35,
                                      ),
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
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Spellings',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontWeight: FontWeight.bold
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
