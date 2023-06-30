import 'package:flutter/material.dart';
import 'package:number_to_word/Roman%20Number/roman_range_wise.dart';

class MyButtonColumn extends StatelessWidget {
  const MyButtonColumn({super.key});

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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1-200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 201,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "201-400",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 401,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "401-600",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 601,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "601-800",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 801,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "801-1000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1001,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1001-1200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1201,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1201-1400",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1401,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1401-1600",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1601,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1601-1800",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RomanRange(
                                            initialValue: 1801,
                                            finalValue: 200,
                                          )));
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
                              child: Text(
                                "1801-2000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        20), // Set the text color to black
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
