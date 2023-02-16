import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterDisplay extends StatefulWidget {
  @override
  _CounterDisplayState createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Counter: $_counter",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _incrementCounter,
                child: Text("Tambah"),
              ),
              const SizedBox(
                width: 5.0,
              ),
              RaisedButton(
                onPressed: _decrementCounter,
                child: Text("Kurang"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
