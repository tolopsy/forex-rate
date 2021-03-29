import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _amountToConvert;
  final List<String> _rates = [
    "Dollar (US)",
    "Pound",
    "Euro",
    "Japanese Yen",
    "Bitcoin",
    "Naira",
  ];

  String _fromCurrency;
  String _toCurrency;

  // TextStyles
  final TextStyle fieldStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  @override
  void initState() {
    _amountToConvert = 0;
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
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Result",
                    style: labelStyle,
                  ),
                  TextField(
                    style: fieldStyle,
                    decoration: InputDecoration(
                        hintText: "Please, Enter the amount to be converted"),
                    onChanged: (text) {
                      var userInput = double.tryParse(text);
                      if (userInput != null) {
                        setState(() {
                          _amountToConvert = userInput;
                        });
                      }
                    },
                  ),
                  Text(
                    "From",
                    style: labelStyle,
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _rates.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _fromCurrency = value;
                      });
                    },
                    value: _fromCurrency,
                  ),
                  Text(
                    "To",
                    style: labelStyle,
                  ),
                  DropdownButton<String>(
                    items: _rates.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _toCurrency = value;
                      });
                    },
                    value: _toCurrency,
                  ),
                  RaisedButton(
                    child: Text(
                      "CONVERT",
                      style: fieldStyle,
                    ),
                    onPressed: () => true,
                  ),
                  Text((_amountToConvert == null)
                      ? ''
                      : _amountToConvert.toString()),
                ],
              ),
            ),
          ),
        ));
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
