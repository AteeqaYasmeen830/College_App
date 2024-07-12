import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sunday extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames=['','OFF Day',''];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Sunday',style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xFF0077B6),
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
                title: Text(arrNames[index],style: TextStyle(color: Color(0xFF0077B6),),),
              );
            },
              separatorBuilder: (context,index){
                return Divider(
                  color: Color(0xFF0077B6),
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