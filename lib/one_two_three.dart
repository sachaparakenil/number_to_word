import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:number_to_word/volume.dart';

double secondlapse = 1;

void main() {
  runApp(const OneTwoThreeScreen());
}

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
      appBar: AppBar(
        title: const Text("Number Pronouncer"),
      ),
      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
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
          onPressed: () {
            OpenDialog();
          },
          tooltip: "Time Lapse",
          child: const Icon(Icons.timelapse_rounded),
        )
      ]),
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
  AudioPlayer audioPlayer = AudioPlayer();
  int _currentNumber = -1;
  int Showint = 0;
  bool _isCounting = false;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double timeLap = 1;

  void _playAudio(int number) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource("$number.mp3"));
  }

  void _toggleCounting() {
    setState(() {
      if (_isCounting) {
        setState(() {});
        _stopCounting();
      } else {
        setState(() {});
        _startCounting();
      }
    });
  }

  void _startCounting() {
    _isCounting = true;
    _timer = Timer.periodic(Duration(seconds: secondlapse.toInt()), (timer) {
      setState(() {
        if (_currentNumber <= 100) {
          _currentNumber++;
          Showint = _currentNumber;
          _playAudio(_currentNumber);
        } else {
          _stopCounting();
        }
      });
    });
  }

  void _stopCounting() {
    _isCounting = false;
    _timer?.cancel();
  }

  void _restartCounting() {
    _stopCounting();
    setState(() {
      Showint = 0;
      _currentNumber = -1;
    });
  }

  @override
  void initState() {
    super.initState();
    _isCounting = false;
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
    audioPlayer.dispose();
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _isCounting ? Colors.yellow : Colors.orangeAccent,
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
                      Showint.toString(),
                      style: const TextStyle(fontSize: 150),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _toggleCounting();
                  if (_isCounting) {
                    _animationController.forward();
                  } else {
                    _animationController.reset();
                  }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(170, 50)),
                child: Text(_isCounting ? 'Stop' : 'Start'),
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
              value: secondlapse,
              min: 1,
              max: 5,
              divisions: 4,
              label: secondlapse.toString(),
              onChanged: (value) {
                setState(() {
                  secondlapse = value;
                });
              }),
        ],
      ),
    );
  }
}
