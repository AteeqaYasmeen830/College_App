import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friday extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames=['DA','Statistices','Break','Project Management',''];
    var number=['8:00AM - 9:00AM','9:00AM - 10:00AM','10:00AM - 10:30AM','10:30AM - 12:00PM',''];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Friday',style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xff1b9bda),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
             color: Colors.white,
            ),
            child: ListView.separated(itemBuilder:(context,index){
              return ListTile(
                title: Text(arrNames[index],style: TextStyle(color: Color(0xff1b9bda),),),
                subtitle: Text(number[index],style: TextStyle(color: Color(0xff1b9bda),),),
              );
            },
              separatorBuilder: (context,index){
                return Divider(
                  color: Color(0xff1b9bda),
                  height: 20,
                  thickness: 2,
                );
              },
              itemCount: arrNames.length,
            ),
          )
      ),
    );
  }
}