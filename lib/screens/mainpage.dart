import 'dart:ui';

import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _screenControllor = TextEditingController();
  Calculator ob = Calculator();
  bool s = false;
  @override
  void initState() {
    super.initState();
  }

  Widget numButtons(String dg) {
    return Expanded(
        child: AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: const EdgeInsets.all(3.0),
      height: 90.0,
      decoration: BoxDecoration(
          color: (s == true) ? Colors.greenAccent : Colors.lightBlueAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            )
          ]),
      child: TextButton(
        autofocus: true,
        style: ButtonStyle(),
        onPressed: () {
          s = !s;
          setState(() {});
          ob.getValue(dg);
          _screenControllor.text = _screenControllor.text + dg;
        },
        child: Text(
          "${dg}",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }

  Widget op(String si) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.black,
            )
          ]),
      height: 90.0,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 5.0,
        ),
        onPressed: () {
          ob.oprator = si;
          _screenControllor.text = _screenControllor.text + si;
          ob.check = true;
        },
        child: Text(
          "${si}",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.3,
                    ),
                  ]),
              child: TextField(
                controller: _screenControllor,
                expands: true,
                minLines: null,
                maxLines: null,
                cursorHeight: 50.0,
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: "0.0"),
              ),
            ),
            Row(
              children: [
                numButtons("9"),
                numButtons("8"),
                numButtons("7"),
                op("/"),
              ],
            ),
            Row(
              children: [
                numButtons("6"),
                numButtons("5"),
                numButtons("4"),
                op("*"),
              ],
            ),
            Row(
              children: [
                numButtons("3"),
                numButtons("2"),
                numButtons("1"),
                op("-"),
              ],
            ),
            Row(
              children: [
                numButtons("."),
                numButtons("0"),
                Expanded(
                    child: Container(
                  decoration:
                      BoxDecoration(color: Colors.yellowAccent, boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                    )
                  ]),
                  height: 90.0,
                  child: TextButton(
                    onPressed: () {
                      ob.equalClick();
                      _screenControllor.text = ob.result.toString();
                      // print(_screenControllor.text);
                      ob.fv = ob.result.toString();
                      print(ob.fv);
                      ob.sv = "";
                      ob.oprator = "";
                      ob.result = "";
                    },
                    child: Text(
                      "=",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
                op("+"),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.cyan, Colors.cyanAccent]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.0,
                          )
                        ]),
                    height: 90.0,
                    child: TextButton(
                      onLongPress: () {},
                      onPressed: () {
                        var l = _screenControllor.text.length;
                        String ch1 = _screenControllor.text;
                        String ch = ch1.substring(l - 1, l);
                        print(_screenControllor.text);

                        print("ch is printing $l");
                        print(ch);

                        ob.deleteClick(ch);
                        _screenControllor.text =
                            _screenControllor.text.substring(0, l - 1);
                        print(_screenControllor.text);
                      },
                      child: Text(
                        "d",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(3.0),
                  height: 90.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.redAccent]),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        ob.deleteLongClick();
                        _screenControllor.text = "";
                      },
                      child: Text(
                        "ce",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
