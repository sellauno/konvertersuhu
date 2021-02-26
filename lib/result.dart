import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final kelvin;
  final reamur;

  Result({
    Key key,
    @required this.kelvin, this.reamur,
  }) : super(key: key);

  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Row(              
        mainAxisAlignment : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Text('Suhu dalam Kelvin'),
              Text(
                kelvin.toStringAsFixed(1),
                style: TextStyle(fontSize: 20, height: 2),
              ),
            ],
          ),
          Column(
            children: [
              Text('Suhu dalam Reamor'),
              Text(
                reamur.toStringAsFixed(3),
                style: TextStyle(fontSize: 20, height: 2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}