import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0Xff0A0E21),
        primaryColor: const Color(0Xff0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0Xff0A0E21),
          centerTitle: true,
        ),
      ),
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}
