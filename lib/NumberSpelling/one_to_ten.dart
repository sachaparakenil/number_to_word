import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';

import '../Additional/constants.dart';

double timeLapse = 3.0;

class OneToTen extends StatefulWidget {
  const OneToTen({super.key});

  @override
  State<OneToTen> createState() => _OneToTenState();
}

class _OneToTenState extends State<OneToTen> {
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
      appBar: AppBar(
        title: const Text("Number Pronouncer"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              openDialog();
              setState(() {});
            },
            tooltip: "Volume Control",
            child: const Icon(Icons.volume_up),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              OpenDialog();
            },
            tooltip: "Time Lapse",
            child: const Icon(Icons.timer),
          ),
        ],
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
  late AnimationController _animationController;
  late Animation<double> _animation;
  double timeLap = 1;

  // Future<void> speakNumber(String numberText) async {
  //   await flutterTts.setLanguage('en-US');
  //   await flutterTts.speak(numberText);
  // }

  Future<void> speakNumber(String numberText) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(spellNumber(numberText as int));
  }

  void togglePronouncing() {
    setState(() {
      if (isPronouncing) {
        setState(() {});
        stopPronouncing();
      } else {
        setState(() {});
        startPronouncing(0, 10);
      }
    });
  }

  void startPronouncing(int initialValue, int finalValue) {
    if (_currentNumber > finalValue) {
      setState(() {
        _currentNumber = initialValue;
      });
    }
    // isPronouncing = true;
    _timer = Timer.periodic(Duration(seconds: timeLapse.toInt()), (timer) {
      setState(() {
        if (_currentNumber < finalValue) {
          // print("1 ${_currentNumber} and ${showint}");
          pronounceNumber(_currentNumber);
          // print("2 ${_currentNumber} and ${showint}");

          _currentNumber++;
          // print("3 ${_currentNumber} and ${showint}");

          showint = _currentNumber;
          // print("4 ${_currentNumber} and ${showint}");
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
    await flutterTts.speak((spellNumber(_currentNumber + 1)).toString());
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
        startPronouncing(0, 10);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    flutterTts.setVolume(0.5);
    flutterTts.setLanguage("en-US");
    isPronouncing = false;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    flutterTts.stop();
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: isPronouncing ? Colors.yellow : Colors.orangeAccent,
        curve: Curves.easeInOut,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Text(
                      shownumber(showint).toString(),
                      style: const TextStyle(fontSize: 70),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  togglePronouncing();
                  if (isPronouncing) {
                    _animationController.forward();
                  } else {
                    _animationController.reset();
                  }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(170, 50)),
                child: Text(isPronouncing ? 'Stop' : 'Start'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _restartCounting,
                style: ElevatedButton.styleFrom(fixedSize: const Size(170, 50)),
                child: const Text('Restart'),
              ),
            ],
          ),
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
              min: 2,
              max: 6,
              divisions: 4,
              label: (timeLapse).toString(),
              onChanged: (value) {
                setState(() {
                  timeLapse = value;
                  if (numberPageState._timer != null &&
                      numberPageState._timer!.isActive) {
                    numberPageState._timer!.cancel();
                    numberPageState.startPronouncing(0, 10);
                  }
                });
              }),
        ],
      ),
    );
  }
}
