import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  final List<Map<String, dynamic>> attendanceRecords = [
    {'date': '2023-07-01', 'status': 'Present'},
    {'date': '2023-07-02', 'status': 'Absent'},
    {'date': '2023-07-03', 'status': 'Present'},
    {'date': '2023-07-04', 'status': 'Present'},
    {'date': '2023-07-05', 'status': 'Absent'},
    // Add more records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0077B6),
          title: Text(
            'Attendance',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Attendance Records',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: attendanceRecords.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: attendanceRecords[index]['status'] == 'Present'
                              ? Colors.green
                              : Colors.red,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          'Date: ${attendanceRecords[index]['date']}',
                          style: TextStyle(color: Color(0xFF0077B6)),
                        ),
                        subtitle: Text(
                          'Status: ${attendanceRecords[index]['status']}',
                          style: TextStyle(color: Color(0xFF0077B6)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

