import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberForm;

  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forex Rates",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Foreign Exchange Rates"),
          ),
          body: Center(
              child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  var userInput = double.tryParse(text);
                  if (userInput != null) {
                    setState(() {
                      _numberForm = userInput;
                    });
                  }
                },
              ),
              Text((_numberForm == null) ? '' : _numberForm.toString())
            ],
          ))),
    );
  }
}

/*
class MyApp extends StatefulWidget {
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
*/
