import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const OneTwoThreeScreen());
}

class OneTwoThreeScreen extends StatelessWidget {
  const OneTwoThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Pronouncer"),
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
  AudioPlayer audioPlayer = AudioPlayer();
  int _currentNumber = 0;
  bool _isCounting = false;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _playAudio(int number) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource("$number.mp3"));
  }

  void _toggleCounting() {
    setState(() {
      if (_isCounting) {
        _stopCounting();
      } else {
        _startCounting();
      }
    });
  }

  void _startCounting() {
    _isCounting = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentNumber <= 100) {
          _currentNumber++;
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
      _currentNumber = 0;
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
                      _currentNumber.toString(),
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
