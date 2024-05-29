import 'package:flutter/material.dart';
import 'package:trip_planner/date_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateSelector(),
    );
  }
}
