import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class Volume extends StatefulWidget {
  const Volume({super.key});

  @override
  State<Volume> createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  double currentvol = 0.5;

  @override
  void initState() {
    PerfectVolumeControl.hideUI = false;
    Future.delayed(Duration.zero, ()async{
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {

      });
    });
    PerfectVolumeControl.stream.listen((Volume) {
      setState(() {
        currentvol = Volume;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 100,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text("Volume", style: TextStyle(fontWeight: FontWeight.bold),),
          Slider(
              value: currentvol,
              onChanged: (Volume){
                currentvol = Volume;
                PerfectVolumeControl.setVolume(Volume);
                setState(() {

                });
              },
            min: 0,
            max: 1,
            divisions: 100,
          ),
        ],
      ),
    );
  }
}
