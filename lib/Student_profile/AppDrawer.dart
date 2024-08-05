import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Setting.dart';
import 'Viewprofile.dart';

class AppDrawer extends StatefulWidget {
  final String studentName;
  final String studentRoll;
  final String studentSemester;
  final String profileImagePath;
  final Function(String) onImageChanged;

  AppDrawer({
    required this.studentName,
    required this.studentRoll,
    required this.studentSemester,
    required this.profileImagePath,
    required this.onImageChanged,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff087ebd),
        child: ListView(
          children: [
            Container(
              height: 220,
              child: DrawerHeader(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                decoration: BoxDecoration(
                  color: Color(0xff087ebd),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _currentProfileImagePath.isNotEmpty
                            ? FileImage(File(_currentProfileImagePath))
                            : AssetImage('assets/images/girlStudent.png')
                        as ImageProvider,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ateeqa Yasmeen',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Roll no 83',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Semester 8th',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildListTile(Icons.person, 'View Profile', context, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Viewprofile(onImageChanged: (newImagePath) {
                    setState(() {
                      _currentProfileImagePath = newImagePath;
                    });
                    widget.onImageChanged(newImagePath);
                  }),
                ),
              );
            }),
            buildListTile(Icons.settings, 'Settings', context, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            }),
            Divider(color: Colors.white54),
            buildListTile(Icons.help, 'Help', context, () {
              // Add navigation logic for Help if needed
            }),
            Divider(color: Colors.white54),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, BuildContext context, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        onTap();
      },
    );
  }
}
