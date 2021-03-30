import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _amountToConvert;
  String _resultMessage;
  final List<String> _rates = [
    "Dollar (US)",
    "Pound",
    "Euro",
    "Japanese Yen",
    "Bitcoin",
    "Naira",
  ];

  final Map<String, int> _ratesMap = {
    "Dollar (US)": 0,
    "Pound": 1,
    "Euro": 2,
    "Japanese Yen": 3,
    "Bitcoin": 4,
    "Naira": 5,
  };

  // _rateMultiplier is the rate of 1 unit of each currency to others.
  // It is represented as a 2 x 2 matrix.
  // To use this in production, You should replace the values in each list with real time values.
  final dynamic _rateMultiplier = {
    '0': [1, 0.73, 0.85, 110.29, 0.000017, 380],
    '1': [1.38, 1, 1.17, 151.79, 0.000024, 522.93],
    '2': [1.17, 0.85, 1, 129.49, 0.000020, 446.26],
    '3': [0.0091, 0.0066, 0.0077, 1, 0.0000001566, 3.45],
    '4': [57909.9, 42067.2, 49315.78, 6385840.49, 1, 22005762],
    '5': [0.0024, 0.0018, 0.0021, 0.29, 0.00000004544, 1],
  };

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

  void convert(double value, String from, String to) {
    int convertFrom = _ratesMap[from];
    int convertTo = _ratesMap[to];

    var multiplier = _rateMultiplier[convertFrom.toString()][convertTo];
    var result = value * multiplier;
    setState(() {
      _resultMessage = "${result.toStringAsFixed(2)} $to";
    });
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
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    (_resultMessage == null) ? '' : _resultMessage,
                    style: labelStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    style: fieldStyle,
                    decoration: InputDecoration(
                        hintText: "Please, Enter the amount to convert"),
                    onChanged: (text) {
                      var userInput = double.tryParse(text);
                      if (userInput != null) {
                        setState(() {
                          _amountToConvert = userInput;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "From",
                    style: labelStyle,
                  ),
                  SizedBox(
                    height: 16,
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
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "To",
                    style: labelStyle,
                  ),
                  SizedBox(
                    height: 16,
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
                        _toCurrency = value;
                      });
                    },
                    value: _toCurrency,
                  ),
                  SizedBox(
                    height: 128,
                  ),
                  RaisedButton(
                    child: Text(
                      "CONVERT",
                      style: fieldStyle,
                    ),
                    onPressed: () {
                      if (_fromCurrency == null ||
                          _toCurrency == null ||
                          _amountToConvert == 0) {
                        return;
                      } else {
                        convert(_amountToConvert, _fromCurrency, _toCurrency);
                      }
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                      (_resultMessage == null)
                          ? ""
                          : "$_amountToConvert $_fromCurrency is $_resultMessage",
                      style: labelStyle)
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
