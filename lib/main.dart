import 'package:flutter/material.dart';
import 'package:week3_user_interactivity/button_sample.dart';
import 'package:week3_user_interactivity/user_input_sample.dart';
import 'package:week3_user_interactivity/form_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Interactivity Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Interactivity Demo"),
        ),
        body: FormSample(),
      ),
    );
  }
}
