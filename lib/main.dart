import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    // can use buildButton widget/function to create lots of button
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.all(16.0),
        ),
        onPressed: () => print("yes"),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Simple Calculator',
          )),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 38.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            // create a space
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Color.fromARGB(255, 255, 0, 0)),
                      buildButton("%", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("⌫", 1, Color.fromARGB(255, 255, 22, 6)),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("8", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("9", 1, Color.fromARGB(255, 255, 22, 6)),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("5", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("6", 1, Color.fromARGB(255, 255, 22, 6)),
                    ]),
                    TableRow(children: [
                      buildButton("3", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("2", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("1", 1, Color.fromARGB(255, 255, 22, 6)),
                    ]),
                    TableRow(children: [
                      buildButton("00", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton("0", 1, Color.fromARGB(255, 255, 22, 6)),
                      buildButton(".", 1, Color.fromARGB(255, 255, 22, 6)),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("÷", 1, Colors.blueAccent),
                    ]),
                    TableRow(children: [
                      buildButton("x", 1, Colors.blueAccent),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blueAccent),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blueAccent),
                    ]),
                    TableRow(children: [
                      buildButton("=", 1, Colors.blueAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
