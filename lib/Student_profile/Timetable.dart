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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timetable',style: TextStyle(color: Colors.white),),
          backgroundColor:  Color(0xff1b9bda), // Updated color
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
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Monday(),),);
                },
                child:Container(
                  child: Card(
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Monday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
                    elevation:10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Tuesday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Wednesday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Thursday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Friday',style: TextStyle(color: Color(0xff1b9bda),fontSize: 20,fontWeight: FontWeight.bold,),)) ,
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
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Saturday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
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
                    elevation: 10,
                    shadowColor: Color(0xff1b9bda), // Updated color
                    child:Container(
                      height: 70,
                      width:double.infinity,
                      child:Center(child: Text('Sunday',style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold,fontSize: 20),)) ,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
