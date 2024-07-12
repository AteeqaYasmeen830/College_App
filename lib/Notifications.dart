import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Exam Schedule",
      "description": "The exam schedule has been updated. Please check the new timings."
    },
    {
      "title": "Holiday Notice",
      "description": "The school will remain closed on 14th August due to Independence Day."
    },
    {
      "title": "Fee Reminder",
      "description": "Please pay the fee for the upcoming semester by the end of this month."
    },
    {
      "title": "Sports Day",
      "description": "Sports Day will be held on 20th July. Participate and show your skills!"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(
                notifications[index]['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  notifications[index]['description']!,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              leading: Icon(
                Icons.notifications,
                color: Colors.blue,
                size: 40.0,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Notification Tapped")),
                );
              },
            ),
          );
        },
      )
          : Center(
        child: Text(
          'No notifications available',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
