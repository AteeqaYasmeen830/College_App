import 'package:college_app/Admission.dart';
import 'package:college_app/Attendance.dart';
import 'package:college_app/Courses.dart';
import 'package:college_app/Event.dart';
import 'package:college_app/Fee.dart';
import 'package:college_app/Notifications.dart';
import 'package:college_app/Assignment.dart';
import 'package:college_app/Timetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class Studentpage extends StatelessWidget {
  final Color primaryColor = Color(0xff087ebd);  // Updated primary color
  final Color backgroundColor = Color(0xFFF0F8FF);
  final TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: AppDrawer(),
        body: Stack(
          children: [
            buildBackground(),
            Column(
              children: [
                SizedBox(height: 40),
                buildProfileCard(),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: buildGrid(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileCard() {
    return Center(
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/girlStudent.png'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ateeqa Yasmeen', style: textStyle.copyWith(fontSize: 20)),
                  Text('Roll no 83', style: textStyle.copyWith(fontSize: 14, color: Colors.grey)),
                  Text('Semester 8th', style: textStyle.copyWith(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildGridItem(context, Icons.add_task, 'Admission', Admission()),
          buildGridItem(context, Icons.event, 'Event', Event()),
          buildGridItem(context, Icons.fact_check_sharp, 'Fee', Fee()),
          buildGridItem(context, Icons.perm_contact_calendar_outlined, 'Attendance', Attendance()),
          buildGridItem(context, Icons.access_alarm, 'Timetable', Timetable()),
          buildGridItem(context, Icons.calendar_month, 'Courses', Courses()),
          buildGridItem(context, Icons.notification_add, 'Notifications', Notifications()),
          buildGridItem(context, Icons.assignment, 'Assignment', Assignment()),
        ],
      ),
    );
  }

  Widget buildGridItem(BuildContext context, IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: primaryColor),
            SizedBox(height: 10),
            Text(title, style: textStyle.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
