import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomNumber = 10;
  double numberRange = 10;

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              '$randomNumber',
              style: TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: Color(0xFF321F47),
              ),
            ),
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Slider(
                    value: numberRange,
                    max: 100,
                    label: numberRange.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        numberRange = value;
                      });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      print('Number Range: $numberRange');
                      randomNumber = random.nextInt(numberRange.round()) + 1;
                      print('Random Number: $randomNumber');
                    });
                  },
                  child: Text(
                    'GENERATE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
