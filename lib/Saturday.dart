import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Saturday extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames=['DBMS','OS','Break','Arabic',''];
    var number=['8:00AM - 9:00AM','9:00AM - 10:00AM','10:00AM - 10:30AM','10:30AM - 12:00PM',''];
    return Scaffold(
        appBar: AppBar(
          title: Text('Saturday',style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xff006769),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFA4EAFE).withOpacity(0.9),
                Color(0xffa4c7c7).withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.separated(itemBuilder:(context,index){
            return ListTile(
              title: Text(arrNames[index],style: TextStyle(color: Color(0xff006769),),),
              subtitle: Text(number[index],style: TextStyle(color: Color(0xff006769),),),
            );
          },
            separatorBuilder: (context,index){
              return Divider(
                color: Color(0xff006769),
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