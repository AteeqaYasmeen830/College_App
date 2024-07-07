import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sun extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames=['','OFF Day',''];
    return Scaffold(
        appBar: AppBar(
          title: Text('Sunday',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: ListView.separated(itemBuilder:(context,index){
            return ListTile(
              title: Text(arrNames[index],style: TextStyle( color: Color(0xFF00B0FF),),),
            );
          },
            separatorBuilder: (context,index){
              return Divider(
                color: Color(0xFF00B0FF),
                height: 20,
                thickness: 2,
              );
            },
            itemCount: arrNames.length,
          ),
        )
    );
  }
}