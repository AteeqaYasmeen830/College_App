import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings',style: TextStyle(color: Colors.white),),
          backgroundColor:  Color(0xff1b9bda),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person,color: Color(0xff1b9bda),),
              title: Text('Update Profile',style: TextStyle(color: Color(0xff1b9bda),),),
              onTap: () {
                // Navigate to update profile page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock,color: Color(0xff1b9bda),),
              title: Text('Change Password',style: (TextStyle(color: Color(0xff1b9bda),)),),
              onTap: () {
                // Navigate to change password page
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Receive Notifications',style: TextStyle(color: Color(0xff1b9bda),),),
              secondary: Icon(Icons.notifications,color: Color(0xff1b9bda),),
              value: true, // Set this to a variable for actual implementation
              onChanged: (bool value) {
                // Handle notification preference change
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language,color: Color(0xff1b9bda),),
              title: Text('Language',style: TextStyle(color: Color(0xff1b9bda),),),
              onTap: () {
                // Navigate to language settings page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info,color: Color(0xff1b9bda),),
              title: Text('About',style: TextStyle(color: Color(0xff1b9bda),),),
              onTap: () {
                // Navigate to about page
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
