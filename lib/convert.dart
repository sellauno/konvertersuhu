import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konversiSuhu;

  Convert({Key key, @required this.konversiSuhu});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment : Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            onPressed: konversiSuhu,
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: Text("Konversi Suhu"),
          ),
        ),
      ),
    );
  }
}