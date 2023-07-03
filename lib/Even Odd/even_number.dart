import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';

import '../Additional/constants.dart';

double timeLapse = 1.0;

//ignore: must_be_immutable
class EvenOdd extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  late int currentNumber;
  late int showInt;
  late String maintext;
  EvenOdd(
      {super.key,
      required this.initialValue,
      required this.finalValue,
      required this.currentNumber,
      required this.showInt, required this.maintext});

  @override
  State<EvenOdd> createState() => _EvenOddState();
}

class _EvenOddState extends State<EvenOdd> {
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
      body: EvenOddNumberPage(
        initialValue: widget.initialValue,
        finalValue: widget.finalValue,
        currentNumber: widget.currentNumber,
        showInt: widget.showInt, maintext: widget.maintext,
      ),
    );
  }
}

//ignore: must_be_immutable
class EvenOddNumberPage extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  late int currentNumber;
  late int showInt;
  late String maintext;
  EvenOddNumberPage(
      {super.key,
      required this.initialValue,
      required this.finalValue,
      required this.currentNumber,
      required this.showInt, required this.maintext});

  @override
  _EvenOddNumberPageState createState() => _EvenOddNumberPageState();
}

class _EvenOddNumberPageState extends State<EvenOddNumberPage>
    with SingleTickerProviderStateMixin {
  late FlutterTts flutterTts;
  bool isPronouncing = false;
  Timer? _timer;
  // late AnimationController _animationController;
  // late Animation<double> _animation;
  // double timeLap = 1;

  void togglePronouncing() {
    setState(() {
      if (isPronouncing) {
        setState(() {});
        stopPronouncing();
      } else {
        setState(() {});
        startPronouncing();
      }
    });
  }

  void startPronouncing() {
    if (widget.currentNumber > widget.finalValue) {
      setState(() {
        widget.currentNumber = widget.initialValue;
      });
    }
    // isPronouncing = true;
    _timer = Timer.periodic(Duration(seconds: timeLapse.toInt()), (timer) {
      setState(() {
        if (widget.currentNumber < widget.finalValue) {
          pronounceNumber(widget.currentNumber);
          widget.currentNumber = widget.currentNumber + 2;
          widget.showInt = widget.currentNumber;
        } else {
          stopPronouncing();
        }
      });
    });
    setState(() {
      isPronouncing = true;
    });
  }

  void pronounceNumber(int number) async {
    await flutterTts.speak((widget.currentNumber + 2).toString());
  }

  void stopPronouncing() {
    _timer?.cancel();
    flutterTts.stop();
    setState(() {
      isPronouncing = false;
    });
  }

  void _restartCounting() {
    stopPronouncing();
    setState(() {
      widget.showInt = widget.initialValue + 1;
      widget.currentNumber = widget.initialValue - 1;
    });
  }

  void update(double value) {
    setState(() {
      timeLapse = value;
      if (_timer != null && _timer!.isActive) {
        _timer!.cancel();
        startPronouncing();
      }
    });
  }

  Future OpenDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
        return const Dialog(
          child: Timelapse(),
        );
      });

  Future pressVolume() => showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
        return const Dialog(
          child: Volume(),
        );
      });

  void _copyToClipboard() {
    var spell = shownumber(widget.showInt);
    String textToCopy =
        'Number: ${widget.showInt.toString()}\nWord: $spell';
    Clipboard.setData(ClipboardData(text: textToCopy));
    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );*/
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setVolume(0.5);
    flutterTts.setLanguage("en-US");
    isPronouncing = false;
  }

  @override
  void dispose() {
    flutterTts.stop();
    _timer?.cancel();
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.maintext,
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
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 190,
              height: 170,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.showInt.toString(),
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      shownumber(widget.showInt).toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconButton(
                        onPressed: () {
                          togglePronouncing();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder()),
                        icon: Image.asset(
                            isPronouncing
                                ? 'assets/images/pause.png'
                                : 'assets/images/play.png',
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff101432)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: _restartCounting,
                              icon: Image.asset('assets/images/reset.png',
                                  fit: BoxFit.contain)),
                          SizedBox(
                            width: 2,
                          ),
                          IconButton(
                              onPressed: _copyToClipboard,
                              icon: Image.asset('assets/images/copy.png',
                                  fit: BoxFit.contain)),
                          SizedBox(
                            width: 2,
                          ),
                          IconButton(
                            onPressed: () {
                              OpenDialog();
                            },
                            icon: Image.asset('assets/images/interval.png',
                                fit: BoxFit.contain),
                          ),
                          SizedBox(
                            width: 2,
                          ),

                          IconButton(
                            onPressed: () {
                              pressVolume();
                            },
                            icon: Image.asset('assets/images/volume.png',
                                fit: BoxFit.contain),
                          ),
                        ],
                      ),
                    ),
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

class Timelapse extends StatefulWidget {
  const Timelapse({super.key});

  @override
  State<Timelapse> createState() => _TimelapseState();
}

class _TimelapseState extends State<Timelapse> {
  _EvenOddNumberPageState numberPageState = _EvenOddNumberPageState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        width: 80,
        height: 120,
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const Text(
              "SET TIME-INTERVAL",
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff101432),fontSize: 20),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 10.0,
                ),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 8.0,
                activeTrackColor: Color(0xffFF8600),
                inactiveTrackColor: Color(0xffEFEFEF),
                thumbColor: Color(0xff101432),
              ),
              child: Slider(
                  value: timeLapse,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: timeLapse.toString(),
                  onChanged: (value) {
                    setState(() {
                      timeLapse = value;
                    });
                  }),
            ),
            const Text(
              "For modification, press pause and then play",
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff101432),fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
