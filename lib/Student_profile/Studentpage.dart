import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admission.dart';
import 'AppDrawer.dart';
import 'Attendance.dart';
import 'Community.dart';
import 'Courses.dart';
import 'Event.dart';
import 'Fee.dart';
import 'Notifications.dart';
import 'Timetable.dart';
import 'Viewprofile.dart';

class Studentpage extends StatefulWidget {
  final String name;
  final String email;

  Studentpage({required this.name, required this.email});

  @override
  _StudentpageState createState() => _StudentpageState();
}

class _StudentpageState extends State<Studentpage> {
  late SharedPreferences _prefs;
  String _currentProfileImagePath = '';

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    String? imagePath = _prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _currentProfileImagePath = imagePath;
      });
    }
  }

  void _updateImage(String newImagePath) {
    setState(() {
      _currentProfileImagePath = newImagePath;
    });
    _prefs.setString('profile_image', newImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff087ebd),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: AppDrawer(
          profileImagePath: _currentProfileImagePath,
          onImageChanged: _updateImage,
          studentName: widget.name,
          studentRoll: '83', // Use dynamic data if available
          studentSemester: '8th', // Use dynamic data if available
          name: widget.name,
          email: widget.email,
        ),
        body: Stack(
          children: [
            buildBackground(),
            Column(
              children: [
                Text(
                  'Student Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                buildProfileCard(context),
                SizedBox(height: 11),
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
      color: Color(0xFFF0F8FF),
      child: Column(
        children: [
          Container(
            height: 205,
            decoration: BoxDecoration(
              color: Color(0xff087ebd),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileCard(BuildContext context) {
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
            InkWell(
              onTap: () {
                // Display image in full screen or larger view
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: CircleAvatar(
                        radius: 150,
                        backgroundImage: _currentProfileImagePath.isNotEmpty
                            ? FileImage(File(_currentProfileImagePath))
                            : AssetImage('assets/images/girlStudent.png')
                                as ImageProvider,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: _currentProfileImagePath.isNotEmpty
                      ? FileImage(File(_currentProfileImagePath))
                      : AssetImage('assets/images/girlStudent.png')
                          as ImageProvider,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.name}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Email: ${widget.email}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Roll no 83',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Semester 8th',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
          buildGridItem(context, Icons.call, 'Community', Community()),
          buildGridItem(context, Icons.access_alarm, 'Timetable', Timetable()),
          buildGridItem(context, Icons.perm_contact_calendar_outlined,
              'Attendance', Attendance()),
          buildGridItem(context, Icons.calendar_month, 'Courses', Courses()),
          buildGridItem(context, Icons.notification_add, 'Notifications',
              Notifications()),
        ],
      ),
    );
  }

  Widget buildGridItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        if (title == 'View Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Viewprofile(
                onImageChanged: _updateImage,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Color(0xff087ebd)),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
