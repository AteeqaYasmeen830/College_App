import 'package:flutter/material.dart';

class StudyGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Study Groups', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff1b9bda),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            GroupDetail(
              title: 'Math Study Group',
              description: 'Discuss and solve math problems together.',
            ),
            GroupDetail(
              title: 'Physics Study Group',
              description: 'Collaborate on physics assignments and projects.',
            ),
            // Add more GroupDetail widgets here if needed
          ],
        ),
      ),
    );
  }
}

class GroupDetail extends StatelessWidget {
  final String title;
  final String description;

  const GroupDetail({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff1b9bda),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Color(0xff1b9bda),
            ),
          ],
        ),
      ),
    );
  }
}
