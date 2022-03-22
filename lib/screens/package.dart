import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              selected = 'first';
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: selected == 'first' ? Colors.blue : Colors.transparent,
            child: Text("First"),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = 'second';
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: selected == 'second' ? Colors.blue : Colors.transparent,
            child: Text("Second"),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = 'third';
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: selected == 'third' ? Colors.blue : Colors.transparent,
            child: Text("third"),
          ),
        ),
        
      ]),
    );
  }
}
