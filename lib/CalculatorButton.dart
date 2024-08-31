import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String num;
  Function onButtonClicked;

  CalculatorButton({required this.num, required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        onButtonClicked(num);
      },
      child: Text(
        num,
        style: TextStyle(fontSize: 24),
      ),
    ));
  }
}
