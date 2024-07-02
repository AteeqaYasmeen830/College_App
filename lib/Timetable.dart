import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Friday.dart';
import 'Monday.dart';
import 'Saturday.dart';
import 'Sunday.dart';
import 'Thursday.dart';
import 'Tuesday.dart';
import 'Wednesday.dart';

class Timetable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames =['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable',style: TextStyle(color: Colors.white),),
        backgroundColor:  Color(0xff006769),
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
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Monday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Monday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Tuesday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Tuesday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Wednesday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Wednesday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Thursday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Thursday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Friday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Friday',style: TextStyle(color: Color(0xff006769),fontSize: 20,fontWeight: FontWeight.bold,),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Saturday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Saturday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sunday(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Sunday',style: TextStyle(color: Color(0xff006769),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
