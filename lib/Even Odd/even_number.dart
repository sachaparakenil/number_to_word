import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';

double timeLapse = 1.0;
//ignore: must_be_immutable
class EvenOdd extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  late int currentNumber;
  late int showInt;
  EvenOdd({super.key, required this.initialValue, required this.finalValue, required this.currentNumber, required this.showInt});

  @override
  State<EvenOdd> createState() => _EvenOddState();
}

class _EvenOddState extends State<EvenOdd> {
  @override
  Widget build(BuildContext context) {
    Future OpenDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            child: Timelapse(),
          );
        });
    Future pressVolume() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
            child: Volume(),
          );
        });


    return Scaffold(
      appBar: AppBar(
        title: const Text("Even Odd Number Pronouncer"),
      ),
      floatingActionButton:
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            pressVolume();
          },
          tooltip: "Volume Control",
          child: const Icon(Icons.volume_up),
        )
      ]),
      body: EvenOddNumberPage(initialValue: widget.initialValue, finalValue: widget.finalValue, currentNumber: widget.currentNumber, showInt: widget.showInt,),
    );
  }
}
//ignore: must_be_immutable
class EvenOddNumberPage extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  late int currentNumber;
  late int showInt;
  EvenOddNumberPage({super.key, required this.initialValue, required this.finalValue, required this.currentNumber, required this.showInt});

  @override
  _EvenOddNumberPageState createState() => _EvenOddNumberPageState();
}

class _EvenOddNumberPageState extends State<EvenOddNumberPage>
    with SingleTickerProviderStateMixin {
  late FlutterTts flutterTts;
  bool isPronouncing = false;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;
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
      widget.currentNumber = widget.initialValue-1;
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
                      widget.showInt.toString(),
                      style: const TextStyle(fontSize: 150),
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
  _EvenOddNumberPageState numberPageState = _EvenOddNumberPageState();

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
                  // if (numberPageState._timer != null &&
                  //     numberPageState._timer!.isActive) {
                  //   numberPageState._timer!.cancel();
                  //   numberPageState.startPronouncing();
                  // }
                });
              }),
        ],
      ),
    );
  }
}