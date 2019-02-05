import 'package:flutter/material.dart';
import 'package:flutter_exercise/ui/logForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Logger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LogForm(),
    );
  }
}