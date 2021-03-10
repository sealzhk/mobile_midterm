import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(new calculator());

class calculator extends StatelessWidget {
  Widget build(BuildContext buildcx) {
    return new MaterialApp(
      title: '',
      home: new calculat(),
    );
  }
}

class calculat extends StatefulWidget {
  calculatorState createState() => calculatorState();
}

class calculatorState extends State<calculat> {

  dynamic text = '0';
  double num1 = 0;
  double num2 = 0;

  dynamic result  = '';
  dynamic finalRes = '';
  dynamic opr = '';
  dynamic preOpr = '';


  Widget btn(number, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 1.5, right: 1.5),
        width: 125.0,
        height: 80.0,
        child: new RaisedButton(
          child: Text(number,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
          onPressed: (){
            calculation(number);
          },
          color: color,
          padding: EdgeInsets.all(20.0),
        )
    );
  }

  Widget btnZero(number, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 1.5, right: 1.5),
        width: 250.0,
        height: 80.0,
        child: new RaisedButton(
          child: Text(number,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
          onPressed: (){
            calculation(number);
          },
          color: color,
          padding: EdgeInsets.all(20.0),

        )
    );
  }

  Widget build(BuildContext buildcx) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0
                  ),
                  textAlign: TextAlign.right,
                ),
            )
          ],
          ),
          Row(
            children: <Widget>[
            btn('C', const Color(0xffa5a5a5)),
            btn('+/-', const Color(0xffa5a5a5)),
            btn('%', const Color(0xffa5a5a5)),
            btn('/', Colors.orange),
          ],),
          Row(
            children: <Widget>[
            btn('7', const Color(0xff333333)),
            btn('8', const Color(0xff333333)),
            btn('9', const Color(0xff333333)),
            btn('X', Colors.orange),
          ],),
          Row(
            children: <Widget>[
            btn('4', const Color(0xff333333)),
            btn('5', const Color(0xff333333)),
            btn('6', const Color(0xff333333)),
            btn('-', Colors.orange),
          ],),
          Row(
            children: <Widget>[
            btn('1', const Color(0xff333333)),
            btn('2', const Color(0xff333333)),
            btn('3', const Color(0xff333333)),
            btn('+', Colors.orange),
          ],),
          Row(
            children: <Widget>[
            btnZero('0', const Color(0xff333333)),
            btn('.', const Color(0xff333333)),
            btn('=', Colors.orange),
          ],),
        ],
      )
    );
  } //end of class

void calculation(number) {
    if (number == 'C') {
      text = '0';
      num1 = 0;
      num2 = 0;

      result  = '';
      finalRes = '';
      opr = '';
      preOpr = '';
    }
    else if (opr == '=' && number == '=') {
      if (preOpr == '+') {
        finalRes = add();
      }
      else if (preOpr == '-') {
        finalRes = minus();
      }
      else if (preOpr == 'X') {
        finalRes = multiplication();
      }
      else if (preOpr == '/') {
        finalRes = division();
      }
    }
    else if (number == '+' || number == '-' || number == 'X' || number == '/' || number == '=') {
      if (num1 == 0) {
        num1 = double.parse(result);
      }
      else {
        num2 = double.parse(result);
      }
      if (opr == '+') {
        finalRes = add();
      }
      else if (opr == '-') {
        finalRes = minus();
      }
      else if (opr == 'X') {
        finalRes = multiplication();
      }
      else if (opr == '/') {
        finalRes = division();
      }
      preOpr = opr;
      opr = number;
      result = '';
    }
    else if (number == '%') {
      result = (num1 / 100).toString();
      finalRes = result;
    }
    else if (number == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalRes = result;
    }
    else if (number == '+/-') {
      if (result.toString().startsWith('-')) {
        result = result.toString().substring(1);
      }
      else {
        result = '-' + result.toString();
      }
      finalRes = result;
    }
    else {
      result += number;
      finalRes = result;
    }
    setState(() {
      text = finalRes;
    });
  }

  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String minus() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String multiplication() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return result;
  }
  String division() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return result;
  }
}