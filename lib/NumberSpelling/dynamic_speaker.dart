import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:number_to_word/Additional/volume.dart';
import '../Additional/constants.dart';
import 'one_to_ten.dart';

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
  // late AnimationController _animationController;
  // late Animation<double> _animation;
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
          pronounceNumber(widget.currentInt);
          widget.currentInt++;
          widget.showInt = widget.currentInt;
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

  void _copyToClipboard() {
    var spell = shownumber(widget.showInt);
    String textToCopy = 'Number: ${widget.showInt.toString()}\nWord: $spell';
    Clipboard.setData(ClipboardData(text: textToCopy));
    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );*/
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

  Future OpenDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
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
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
        return const Dialog(
          child: Volume(),
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
        child: Center(
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
                            Text("Spelling",
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
              const SizedBox(height: 20.0),
              Container(
                // padding: EdgeInsets.only(right: 70, left: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
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
                                onPressed: _copyToClipboard,
                                icon: Image.asset('assets/images/copy.png',
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
                                PressVolume();
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
      height: 120,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text(
            "SET TIME-INTERVAL",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff101432),
                fontSize: 20),
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
          ),
          const Text(
            "For modification, press pause and then play",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff101432),
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
