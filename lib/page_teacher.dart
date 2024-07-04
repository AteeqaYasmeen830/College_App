
import 'package:college_app/teacher_profile/T_attendence.dart';
import 'package:college_app/teacher_profile/T_community.dart';
import 'package:college_app/teacher_profile/T_notification.dart';
import 'package:college_app/teacher_profile/T_timetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> with SingleTickerProviderStateMixin {
  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  late  AnimationController _controller;
  late Animation<double> _profileCardAnimation;
  late  Animation<double> _gridAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _profileCardAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _gridAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                buildAnimatedProfileCard(),
                SizedBox(height: 60),
                buildAnimatedGrid(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackground() {
    return Stack(
      children: [
        Container(
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
        ),
      ],
    );
  }

  Widget buildAnimatedProfileCard() {
    return AnimatedBuilder(
      animation: _profileCardAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _profileCardAnimation.value,
          child: Padding(
            padding: EdgeInsets.only(top: 100 * (1 - _profileCardAnimation.value)),
            child: child,
          ),
        );
      },
      child: buildProfileCard(),
    );
  }

  Widget buildProfileCard() {
    return Center(
      child: Container(
        height: 180,
        width: 320,
        decoration: BoxDecoration(
          color: Color(0xff006769).withOpacity(1),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Color(0xFFA4EAFE).withOpacity(0.9),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFA4EAFE).withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Image(
                image: AssetImage('assets/images/girlStudent.png'),
              ),
            ),
            SizedBox(height: 5),
            Text('Ateeqa Yasmeen', style: textStyle),
            Text('Roll no 83', style: textStyle),
            Text('Semester 8th', style: textStyle),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedGrid(BuildContext context) {
    return AnimatedBuilder(
      animation: _gridAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _gridAnimation.value,
          child: child,
        );
      },
      child: buildGrid(context),
    );
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      width: 320,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [
          buildGridItem(context, Icons.add_task, 'Attendance', AttendenceT()),
          buildGridItem(context, Icons.event, 'Notifications', NotificationT()),
          buildGridItem(context, Icons.fact_check_sharp, 'Timetable', TimetableT()),
          buildGridItem(context, Icons.call, 'Community', CommunityT()),
        ],
      ),
    );
  }

  Widget buildGridItem(BuildContext context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
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
            color: Color(0xff006769).withOpacity(1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color(0xFFA4EAFE).withOpacity(0.9),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFA4EAFE).withOpacity(0.9),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 70, color: Colors.white),
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
