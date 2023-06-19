import 'package:flutter/material.dart';

void main() {
  runApp(const OneToTen());
}

class OneToTen extends StatefulWidget {
  const OneToTen({super.key});


  @override
  State<OneToTen> createState() => _OneToTenState();
}

class _OneToTenState extends State<OneToTen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("One To Ten"),
      ),
      );
  }
}
