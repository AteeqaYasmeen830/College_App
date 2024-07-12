import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  // Assuming student profile details
  final String studentName = "John Doe";
  final String studentEmail = "john.doe@example.com";
  final String profileImage = "assets/profile_pic.jpg"; // Example image path

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff087ebd), // Background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff087ebd), // Background color of the header
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(height: 10),
                  Text(
                    studentName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    studentEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            buildListTile(Icons.person, 'View Profile', context),
            buildListTile(Icons.settings, 'Settings', context),
            Divider(color: Colors.white54),
            buildListTile(Icons.help, 'Help', context),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, BuildContext context) {
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
        // Add your navigation logic here
      },
    );
  }
}
