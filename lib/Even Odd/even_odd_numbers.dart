import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_to_word/Even%20Odd/even_number.dart';

class EvenOddNumber extends StatelessWidget {
  const EvenOddNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 16.0),
                SafeArea(
                  child: Container(
                    height: 90,
                    child: Container(
                      height: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ODD EVEN",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            Text("Numbers",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25, left: 10, right: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EvenOdd(
                                    initialValue: 0,
                                    finalValue: 99,
                                    showInt: 1,
                                    currentNumber: -1,
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 30, right: 30, left: 30),
                          child: Text(
                            'ODD',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: const Image(
                              image: AssetImage(
                                "assets/images/enter.png",
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, left: 5, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EvenOdd(
                                    initialValue: 1,
                                    finalValue: 100,
                                    showInt: 2,
                                    currentNumber: 0,
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 30, right: 30, left: 30),
                          child: Text(
                            'Even',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: const Image(
                              image: AssetImage(
                                "assets/images/enter.png",
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
