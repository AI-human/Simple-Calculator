import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // equation solver flutter package

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
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontsize = 38.0, resultFontsize = 48;

  buttonPressed(String buttonText) {
    // function for button to work
    setState(() {
      if (buttonText == 'C') {
        equation = "0";
        result = "0";
        equationFontsize = 38.0;
        resultFontsize = 48.0;
      } else if (buttonText == '⌫') {
        equationFontsize = 48.0;
        resultFontsize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontsize = 38.0;
        resultFontsize = 48.0;
        expression = equation;
        expression = equation.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          // equation solver flutter package
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontsize = 48.0;
        resultFontsize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation += buttonText;
        }
      }
    });
  }

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
        onPressed: () => buttonPressed(buttonText),
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
            color: Color.fromARGB(221, 255, 255, 255),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontsize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            color: Color.fromARGB(221, 255, 255, 255),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontsize),
            ),
          ),
          Expanded(
            // create a spacec
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
                      buildButton("%", 1, Colors.blueAccent),
                      buildButton("⌫", 1, Colors.blueAccent),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.black87),
                      buildButton("8", 1, Colors.black87),
                      buildButton("9", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black87),
                      buildButton("5", 1, Colors.black87),
                      buildButton("6", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton("3", 1, Colors.black87),
                      buildButton("2", 1, Colors.black87),
                      buildButton("1", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton("00", 1, Colors.black87),
                      buildButton("0", 1, Colors.black87),
                      buildButton(".", 1, Colors.black87),
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
                      buildButton("=", 1, Color.fromARGB(255, 255, 0, 0)),
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
