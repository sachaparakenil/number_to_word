import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';
import '../Additional/constants.dart';
import 'one_to_ten.dart';
import 'package:flutter/services.dart';

class DynamicSpeaker extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  final int showInt;
  final int currentInt;
  DynamicSpeaker(
      {super.key,
      required this.initialValue,
      required this.finalValue,
      required this.showInt,
      required this.currentInt});

  @override
  State<DynamicSpeaker> createState() => _DynamicSpeakerState();
}

class _DynamicSpeakerState extends State<DynamicSpeaker> {
  @override
  Widget build(BuildContext context) {
    Future OpenDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: DynamicTimelapse(
                initialValue: widget.initialValue,
                finalValue: widget.finalValue,
                showInt: widget.showInt,
                currentInt: widget.currentInt),
          );
        });
    Future PressVolume() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Volume(),
          );
        });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Pronouncer"),
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
          onPressed: () {
            PressVolume();
          },
          tooltip: "Volume Control",
          child: const Icon(Icons.volume_up),
        )
      ]),
      body: DynamicNumberPage(
          initialValue: widget.initialValue,
          finalValue: widget.finalValue,
          showInt: widget.showInt,
          currentInt: widget.currentInt),
    );
  }
}

//ignore: must_be_immutable
class DynamicNumberPage extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  late int showInt;
  late int currentInt;
  DynamicNumberPage(
      {super.key,
      required this.initialValue,
      required this.finalValue,
      required this.showInt,
      required this.currentInt});

  @override
  DynamicNumberPageState createState() => DynamicNumberPageState();
}

class DynamicNumberPageState extends State<DynamicNumberPage>
    with SingleTickerProviderStateMixin {
  late FlutterTts flutterTts;
  bool isPronouncing = false;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double timeLap = 2;

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
        startPronouncing(widget.initialValue, widget.finalValue);
      }
    });
  }

  void startPronouncing(int initialValue, int finalValue) {
    if (widget.currentInt > finalValue) {
      setState(() {
        widget.currentInt = initialValue;
      });
    }
    // isPronouncing = true;
    _timer = Timer.periodic(Duration(seconds: timeLapse.toInt()), (timer) {
      setState(() {
        if (widget.currentInt < finalValue) {
          // print("1 ${_currentNumber} and ${showint}");
          pronounceNumber(widget.currentInt);
          // print("2 ${_currentNumber} and ${showint}");

          widget.currentInt++;
          // print("3 ${_currentNumber} and ${showint}");

          widget.showInt = widget.currentInt;
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
    await flutterTts.speak((spellNumber(widget.currentInt + 1)).toString());
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
      widget.showInt = widget.initialValue;
      widget.currentInt = widget.initialValue - 1;
    });
  }

  void update(double value) {
    setState(() {
      timeLapse = value;
      if (_timer != null && _timer!.isActive) {
        _timer!.cancel();
        startPronouncing(widget.initialValue, widget.finalValue);
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
                      shownumber(widget.showInt).toString(),
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

class DynamicTimelapse extends StatefulWidget {
  final int initialValue;
  final int finalValue;
  final int showInt;
  final int currentInt;
  DynamicTimelapse(
      {super.key,
      required this.initialValue,
      required this.finalValue,
      required this.showInt,
      required this.currentInt});

  @override
  State<DynamicTimelapse> createState() => DynamicTimelapseState();
}

class DynamicTimelapseState extends State<DynamicTimelapse> {
  // _NumberPageState numberPageState = _NumberPageState();

  DynamicNumberPageState dynamicNumberPageState = DynamicNumberPageState();

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
              min: 3,
              max: 7,
              divisions: 4,
              label: (timeLapse).toString(),
              onChanged: (value) {
                setState(() {
                  timeLapse = value;
                  if (dynamicNumberPageState._timer != null &&
                      dynamicNumberPageState._timer!.isActive) {
                    dynamicNumberPageState._timer!.cancel();
                    dynamicNumberPageState.startPronouncing(
                        widget.initialValue, widget.finalValue);
                  }
                });
              }),
        ],
      ),
    );
  }
}