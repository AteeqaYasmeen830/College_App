import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fee extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        'Fee',
        style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Color(0xff006769),
    ),
    body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Color(0xff006769).withOpacity(0.9),
    Color(0xFFA4EAFE).withOpacity(0.9),
    Color(0xffa4c7c7).withOpacity(0.9),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),
    ),
    );
  }

}