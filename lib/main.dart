import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            TextFormField(
              controller : inputController,
              decoration: const InputDecoration(
                hintText : 'Masukkan Suhu dalam Celcius',
              ),
              keyboardType :  TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Row(              
                mainAxisAlignment : MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Text('Suhu dalam Kelvin'),
                      Text(
                        _kelvin.toStringAsFixed(1),
                        style: TextStyle(fontSize: 20, height: 2),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Suhu dalam Reamor', 
                       ),
                      Text(
                        _reamur.toStringAsFixed(3),
                        style: TextStyle(fontSize: 20, height: 2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 50.0,
            ),
            Column(
              crossAxisAlignment : CrossAxisAlignment.center,
              mainAxisAlignment : MainAxisAlignment.end,
              mainAxisSize : MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: _konversiSuhu,
                    color: Colors.blue,
                    child: Text(
                      'Konverter Suhu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}

//other classes

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
      keyboardType: TextInputType.number,
    );
  }
}

class Convert extends StatelessWidget {
  final Function konvertHandler;

  Convert({Key key, @required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}