// Slider(
// value: timeLap,
// min: 1,
// max: 5,
// divisions: 4,
// label: timeLap.toString(),
// onChanged: (value) {
// setState(() {
// timeLap = value;
// });
// }),
import 'package:flutter/material.dart';

class Timelapse extends StatefulWidget {
  const Timelapse({super.key});

  @override
  State<Timelapse> createState() => _TimelapseState();
}

class _TimelapseState extends State<Timelapse> {
  double secondlapse = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 100,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text("TimeLapse", style: TextStyle(fontWeight: FontWeight.bold),),
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
