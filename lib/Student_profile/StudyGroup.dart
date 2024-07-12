import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Community.dart';

class StudyGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Study Groups',style: TextStyle(color: Colors.white),),
           backgroundColor: Color(0xFF0077B6),
           iconTheme: IconThemeData(
             color: Colors.white,
           ),
         ),
         body: ListView(
           padding: EdgeInsets.all(16),
           children: [
             GroupDetail(
               title: 'Math Study Group',
               description: 'Discuss and solve math problems together.',
             ),
             GroupDetail(
               title: 'Physics Study Group',
               description: 'Collaborate on physics assignments and projects.',
             ),
             // Add more GroupDetail widgets here
           ],
         ),
       ),
     );
  }
}