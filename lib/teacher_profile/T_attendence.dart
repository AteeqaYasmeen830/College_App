
import 'package:college_app/teacher_profile/screen_attendence.dart';
import 'package:college_app/teacher_profile/student_add.dart';
import 'package:flutter/material.dart';

class AttendenceT extends StatelessWidget {
  const AttendenceT({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006769).withOpacity(1),
        title: Text(
          'Attendance App',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: 'RobotoSlab-VariableFont',
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff006769).withOpacity(0.9),
              Color(0xFFA4EAFE).withOpacity(0.9),
              Color(0xffa4c7c7).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  color: Color(0xff006769).withOpacity(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Attendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  color: Color(0xff006769).withOpacity(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddStudentPage(),
                      ),
                    );
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
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
