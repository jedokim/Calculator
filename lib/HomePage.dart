import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      log('incrementCounter');
      log(_counter.toString());
      print('print counter');
      print(_counter);
      var foo = {};
      foo[0] = 'test';

      print(foo);

      var test = http
          .get('https://jsonplaceholder.typicode.com/albums/1')
          .then((value) => {print(value)})
          .then((res) => {print(res)});

      print(test);
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        onPressed: null,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white
          )
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text('0', style: TextStyle(fontSize:38.0),),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text('0', style: TextStyle(fontSize:48.0),),
          ),

          // Top
          Expanded(child: Divider(),),

          // Bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        this.buildButton('C', 1, Colors.greenAccent),
                        this.buildButton('BkSpc', 1, Colors.blueAccent),
                        this.buildButton('/', 1, Colors.blueAccent),
                      ]
                    ),
                    TableRow(
                      children: [
                        this.buildButton('7', 1, Colors.black54),
                        this.buildButton('8', 1, Colors.black54),
                        this.buildButton('9', 1, Colors.black54),
                      ]
                    ),
                    TableRow(
                      children: [
                        this.buildButton('4', 1, Colors.black54),
                        this.buildButton('5', 1, Colors.black54),
                        this.buildButton('6', 1, Colors.black54),
                      ]
                    ),
                    TableRow(
                      children: [
                        this.buildButton('1', 1, Colors.black54),
                        this.buildButton('2', 1, Colors.black54),
                        this.buildButton('3', 1, Colors.black54),
                      ]
                    ),
                    TableRow(
                      children: [
                        this.buildButton('.', 1, Colors.black54),
                        this.buildButton('0', 1, Colors.black54),
                        this.buildButton('00', 1, Colors.black54),
                      ]
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}