import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Update Profile'),
            onTap: () {
              // Navigate to update profile page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              // Navigate to change password page
            },
          ),
          Divider(),
          SwitchListTile(
            title: Text('Receive Notifications'),
            secondary: Icon(Icons.notifications),
            value: true, // Set this to a variable for actual implementation
            onChanged: (bool value) {
              // Handle notification preference change
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Navigate to about page
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
