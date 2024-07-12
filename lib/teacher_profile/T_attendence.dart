import 'package:college_app/teacher_profile/screen_attendence.dart';
import 'package:college_app/teacher_profile/student_add.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AttendenceT extends StatefulWidget {
  const AttendenceT({Key? key}) : super(key: key);

  @override
  _AttendenceTState createState() => _AttendenceTState();
}

class _AttendenceTState extends State<AttendenceT> {
  bool _isMoved = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _isMoved = !_isMoved;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00B0FF),
        title: Text(
          'Attendance App',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontFamily: 'RobotoSlab-VariableFont',
          ),
        ),
      ),
      body: Container(
       color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: _isMoved ? 10 : 20, vertical: 20),
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF00B0FF)
                ),
                child: MaterialButton(
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
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: _isMoved ? 20 : 10, vertical: 20),
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF00B0FF),
                ),
                child: MaterialButton(
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
