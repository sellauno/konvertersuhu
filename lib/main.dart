import 'package:flutter/material.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  TextEditingController inputController = new TextEditingController();

  void _konversiSuhu(){
    setState((){
      _inputUser = double.parse(inputController.text);
      _reamur = 4/5 * _inputUser;
      _kelvin = 273 + _inputUser;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
      appBar: AppBar(
      title: Text("Konverter Suhu"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Input(inputController: inputController),
            Result(kelvin: _kelvin, reamur: _reamur),
            Divider(
              height: 50.0,
            ),
            Convert(konversiSuhu: _konversiSuhu),
          ],
        ),
      ),
      ),
    );
  }
}