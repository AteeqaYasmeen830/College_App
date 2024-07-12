import 'package:flutter/material.dart';
import 'Assignment.dart';
import 'Chart.dart';
import 'Resources.dart';
import 'StudyGroup.dart';

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Community',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF0077B6),
          iconTheme:  IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0077B6).withOpacity(0.9),
                Colors.white.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Center(
                child: Text(
                  'Student Community',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              CommunityCard(
                title: 'Study Groups',
                description: 'Collaborate with peers in study groups.',
                icon: Icons.group,
                color: Color(0xFF0077B6),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  StudyGroup()),
                  );
                },
              ),
              CommunityCard(
                title: 'Resources',
                description: 'Access a variety of study materials and resources.',
                icon: Icons.book,
                color: Color(0xFF0077B6),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resources()),
                  );
                },
              ),
              CommunityCard(
                title: 'Chat',
                description: 'Chat with other students in real-time.',
                icon: Icons.chat,
                color: Color(0xFF0077B6),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                  );
                },
              ),
              CommunityCard(
                title: 'Assignment Upload',
                description: 'Upload your assignments easily.',
                icon: Icons.upload_file,
                color: Color(0xFF0077B6),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Assignment()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CommunityCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        onTap: onTap,
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
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0077B6),
            fontSize: 18,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_forward, color: Color(0xFF0077B6)),
        onTap: () {
          // Navigate to detailed group page or perform action
        },
      ),
    );
  }
}


