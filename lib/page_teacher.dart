import 'package:college_app/teacher_profile/T_attendence.dart';
import 'package:college_app/teacher_profile/T_community.dart';
import 'package:college_app/teacher_profile/T_notification.dart';
import 'package:college_app/teacher_profile/T_timetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('profile_image', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildTopContainer(),
            buildMiddleContainer(),
            buildBottomContainer(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xFF00B0FF),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildTopContainer() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFF00B0FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Teacher Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'RobotoSlab-VariableFont',
          ),
        ),
      ),
    );
  }

  Widget buildMiddleContainer() {
    return Container(
      width: 340,
      height: 160,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      transform: Matrix4.translationValues(0, -40, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : AssetImage('assets/images/girlStudent.png') as ImageProvider,
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mam Sadaf',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab-VariableFont',
                  color: Colors.black,
                ),
              ),
              Text(
                'HOD BSIT',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomContainer(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(context, Icons.add_task, 'Attendance', AttendenceT()),
                buildContainer(context, Icons.event, 'Notifications', NotificationT()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(context, Icons.fact_check_sharp, 'Timetable', TimetableT()),
                buildContainer(context, Icons.call, 'Community', CommunityT()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, IconData icon, String title, Widget page) {
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
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Color(0xFF00B0FF)),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoSlab-VariableFont',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.add_task, color: Color(0xFF00B0FF)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendenceT(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.event, color: Color(0xFF00B0FF)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationT(),
                  ),
                );
              },
            ),
            SizedBox(width: 40),
            IconButton(
              icon: Icon(Icons.fact_check_sharp, color: Color(0xFF00B0FF)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimetableT(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.call, color: Color(0xFF00B0FF)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityT(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
