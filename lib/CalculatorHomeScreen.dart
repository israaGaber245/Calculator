import 'package:calculator/CalculatorButton.dart';
import 'package:flutter/material.dart';

class CalculatorHomeScreen extends StatefulWidget {
  @override
  State<CalculatorHomeScreen> createState() => _CalculatorHomeScreenState();
}

class _CalculatorHomeScreenState extends State<CalculatorHomeScreen> {
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Text(
                res,
                style: TextStyle(fontSize: 24),
              )),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(num: 'C', onButtonClicked: onClickedClear),
              CalculatorButton(num: 'sqr', onButtonClicked: onClickedSqr),
              CalculatorButton(num: '%', onButtonClicked: onClickedOperator),
              CalculatorButton(num: 'Del', onButtonClicked: onClickedDel)
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(num: '7', onButtonClicked: onClicked),
              CalculatorButton(num: '8', onButtonClicked: onClicked),
              CalculatorButton(num: '9', onButtonClicked: onClicked),
              CalculatorButton(num: '*', onButtonClicked: onClickedOperator)
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(num: '4', onButtonClicked: onClicked),
              CalculatorButton(num: '5', onButtonClicked: onClicked),
              CalculatorButton(num: '6', onButtonClicked: onClicked),
              CalculatorButton(num: '/', onButtonClicked: onClickedOperator)
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(num: '1', onButtonClicked: onClicked),
              CalculatorButton(num: '2', onButtonClicked: onClicked),
              CalculatorButton(num: '3', onButtonClicked: onClicked),
              CalculatorButton(num: '+', onButtonClicked: onClickedOperator)
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(num: '.', onButtonClicked: onClicked),
              CalculatorButton(num: '0', onButtonClicked: onClicked),
              CalculatorButton(num: '=', onButtonClicked: onClickedEqual),
              CalculatorButton(num: '-', onButtonClicked: onClickedOperator)
            ],
          )),
        ],
      ),
    );
  }

  String lhs = '';
  String operator = '';

  void onClicked(num) {
    res += num;
    setState(() {});
  }

  void onClickedOperator(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = res;
    } else {
      String rhs = res;
      lhs = calculation(lhs, rhs, operator);
    }
    operator = clickedOperator;
    res = '';
    setState(() {});
  }

  String calculation(lhs, rhs, operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;
    if (operator == '+') {
      res += num1 + num2;
    } else if (operator == "-") {
      res += num1 - num2;
    } else if (operator == "*") {
      res += num1 * num2;
    } else if (operator == "/") {
      res += num1 / num2;
    } else if (operator == "%") {
      res += num1 % num2;
    }
    return res.toString();
  }

  void onClickedEqual(text) {
    String rhs = res;
    res = calculation(lhs, rhs, operator);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClickedClear(text) {
    res = '';
    setState(() {});
  }

  void onClickedSqr(text) {
    lhs = res;
    res = '';
    double num = double.parse(lhs);
    res += (num * num).toString();
    setState(() {});
  }

  void onClickedDel(text) {
    res = res.substring(0, res.length - 1);
    setState(() {});
  }
}
