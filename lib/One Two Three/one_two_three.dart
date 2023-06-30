import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';

void main() {
  runApp(const OneTwoThreeScreen());
}

double timeLapse = 1.0;

class OneTwoThreeScreen extends StatefulWidget {
  const OneTwoThreeScreen({super.key});

  @override
  State<OneTwoThreeScreen> createState() => _OneTwoThreeScreenState();
}

class _OneTwoThreeScreenState extends State<OneTwoThreeScreen> {
  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            child: Volume(),
          );
        });
    Future OpenDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            child: Timelapse(),
          );
        });

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
      body: const NumberPage(),
    );
  }
}

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage>
    with SingleTickerProviderStateMixin {
  int _currentNumber = -1;
  int showint = 0;
  late FlutterTts flutterTts;
  bool isPronouncing = false;
  Timer? _timer;
  // double timeLapse = 1.0;
  /*late AnimationController _animationController;
  late Animation<double> _animation;*/
  double timeLap = 1;

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
    if (_currentNumber > 100) {
      setState(() {
        _currentNumber = 1;
      });
    }
    // isPronouncing = true;
    _timer = Timer.periodic(Duration(seconds: timeLapse.toInt()), (timer) {
      setState(() {
        if (_currentNumber < 100) {
          pronounceNumber(_currentNumber);
          _currentNumber++;
          showint = _currentNumber;
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
    await flutterTts.speak((_currentNumber + 1).toString());
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
      showint = 0;
      _currentNumber = -1;
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

  Future pressVolume() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: Volume(),
        );
      });
  Future OpenDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: Timelapse(),
        );
      });

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
                          Text("NUMBER",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white)),
                          Text("Pronouncer",
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white))
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  showint.toString(),
                  style: const TextStyle(fontSize: 70),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              // padding: EdgeInsets.only(right: 70, left: 70),
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
                        // shape: BoxShape.circle,
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
                            width: 3,
                          ),
                          IconButton(
                            onPressed: () {
                              OpenDialog();
                            },
                            icon: Image.asset('assets/images/interval.png',
                                fit: BoxFit.contain),
                          ),
                          SizedBox(
                            width: 3,
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
  _NumberPageState numberPageState = _NumberPageState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 100,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text(
            "TimeLapse",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Slider(
              value: timeLapse,
              min: 1,
              max: 5,
              divisions: 4,
              label: timeLapse.toString(),
              onChanged: (value) {
                setState(() {
                  timeLapse = value;
                  if (numberPageState._timer != null &&
                      numberPageState._timer!.isActive) {
                    numberPageState._timer!.cancel();
                    numberPageState.startPronouncing();
                  }
                });
              }),
          const Text(
            "Press stop and then start to reflect change",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
