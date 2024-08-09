import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'T_attendence.dart';
import 'T_community.dart';
import 'T_notification.dart';
import 'T_timetable.dart';

class TeacherPage extends StatefulWidget {
  final name;
  @override
  TeacherPage({required this.name});
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late SharedPreferences _prefs;
  String _currentProfileImagePath = '';
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateToSelectedPage(index);
  }

  void _navigateToSelectedPage(int index) {
    Widget selectedPage;
    if (index == 1) {
      selectedPage = NotificationT(); // Teacher Notifications
    } else if (index == 2) {
      selectedPage = CommunityT(); // Teacher Community
    } else {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedPage),
    ).then((_) {
      setState(() {
        _selectedIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackground(),
            Column(
              children: [
                buildProfileAvatar(),
                buildProfileCard(),
                Expanded(
                  child: SingleChildScrollView(
                    child: buildGrid(),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1b9bda),
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xff1b9bda),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileAvatar() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              _updateImage(pickedFile.path);
            }
          },
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey[300],
            backgroundImage: _currentProfileImagePath.isNotEmpty
                ? FileImage(File(_currentProfileImagePath))
                : AssetImage('assets/images/girlStudent.png') as ImageProvider,
            child: _currentProfileImagePath.isEmpty
                ? Icon(Icons.person, size: 60, color: Colors.white)
                : null,
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard() {
    return Center(
      child: Container(
        height: 75,
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text('${widget.name}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Center(
                      child: Text('HOD BSIT',
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGrid() {
    return Container(
      padding: EdgeInsets.only(top: 17, left: 30, right: 30, bottom: 9),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildGridItem(Icons.add_task, 'Attendance', AttendenceT()),
          buildGridItem(Icons.event, 'Notifications', NotificationT()),
          buildGridItem(Icons.fact_check_sharp, 'Timetable', TimetableT()),
          buildGridItem(Icons.call, 'Community', CommunityT()),
        ],
      ),
    );
  }

  Widget buildGridItem(IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
