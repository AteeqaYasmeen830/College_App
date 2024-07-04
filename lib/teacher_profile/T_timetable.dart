import 'package:college_app/teacher_profile/T_fri.dart';
import 'package:college_app/teacher_profile/T_mon.dart';
import 'package:college_app/teacher_profile/T_sat.dart';
import 'package:college_app/teacher_profile/T_sun.dart';
import 'package:college_app/teacher_profile/T_thurs.dart';
import 'package:college_app/teacher_profile/T_tue.dart';
import 'package:college_app/teacher_profile/T_wed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimetableT extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames =['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFA4EAFE).withOpacity(0.9),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Mon(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color:Color(0xff006769) ,
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Monday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Tue(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Tuesday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Wed(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Wednesday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Thurs(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Thursday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Fri(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Friday',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sat(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Saturday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sun(),),);
              },
              child:Container(
                child: Card(
                  child:Container(
                    color: Color(0xff006769),
                    height: 70,
                    width:double.infinity,
                    child:Center(child: Text('Sunday',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
