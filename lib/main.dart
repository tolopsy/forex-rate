import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forex Rates",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Foreign Exchange Rates"),
          ),
          body: Center(
            child: Text("Find conversion rate of any currency pair"),
          )),
    );
  }
}
