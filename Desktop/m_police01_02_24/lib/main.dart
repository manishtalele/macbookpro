import 'package:flutter/material.dart';
import 'package:m_police01_02_24/view/screen/splashScreen.dart';

double sizeHeight = 0.00;
double sizeWidth = 0.00;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'M Police',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
