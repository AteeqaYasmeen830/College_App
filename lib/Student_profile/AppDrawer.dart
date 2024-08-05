import 'dart:io';
import 'package:flutter/material.dart';
import 'Viewprofile.dart';
import 'Setting.dart';

class AppDrawer extends StatelessWidget {
  final String studentName;
  final String profileImagePath;
  final Function(String) onImageChanged;
  final VoidCallback onProfileImageClick;

  AppDrawer({
    required this.studentName,
    required this.profileImagePath,
    required this.onImageChanged,
    required this.onProfileImageClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1b9bda), // Updated color
      child: ListView(
        children: [
          Container(
            height: 220,
            child: DrawerHeader(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              decoration: BoxDecoration(
                color: Color(0xff1b9bda), // Updated color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: GestureDetector(
                      onTap: onProfileImageClick,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300], // Placeholder background color
                        backgroundImage: profileImagePath.isNotEmpty
                            ? FileImage(File(profileImagePath))
                            : AssetImage('assets/images/defaultProfile.png') as ImageProvider,
                        child: profileImagePath.isEmpty
                            ? Icon(Icons.person, size: 50, color: Colors.white) // Placeholder icon
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          studentName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                  onImageChanged(newImagePath);
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
    );
  }

  ListTile buildListTile(IconData icon, String title, BuildContext context, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
