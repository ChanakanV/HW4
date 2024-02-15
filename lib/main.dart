import 'package:flutter/material.dart';
import 'package:homework4/pages/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple[100], // กำหนดสีพื้นหลังสีม่วงอ่อน
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const hw(),
    );
  }
}