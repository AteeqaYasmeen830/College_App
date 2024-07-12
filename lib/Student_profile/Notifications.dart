import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Notifications(),
));

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

  void navigateToDetailPage(BuildContext context, Map<String, String> notification) {
    if (notification['title'] == "Exam Schedule") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExamScheduleDetailPage(notification: notification)),
      );
    } else if (notification['title'] == "Holiday Notice") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HolidayNoticeDetailPage(notification: notification)),
      );
    } else if (notification['title'] == "Fee Reminder") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FeeReminderDetailPage(notification: notification)),
      );
    } else if (notification['title'] == "Sports Day") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SportsDayDetailPage(notification: notification)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationDetailPage(notification: notification)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF0077B6),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: notifications.isNotEmpty
            ? ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  navigateToDetailPage(context, notifications[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF0077B6),
                            size: 30.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notifications[index]['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                notifications[index]['description']!,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
            : Center(
          child: Text(
            'No notifications available',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF0077B6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const NotificationDetailPage({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification['title']!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0077B6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              notification['description']!,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamScheduleDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const ExamScheduleDetailPage({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification['title']!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0077B6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Exam Schedule Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  ExamScheduleCard(
                    subject: "Math Exam",
                    date: "20th July",
                    time: "9:00 AM - 12:00 PM",
                  ),
                  ExamScheduleCard(
                    subject: "Science Exam",
                    date: "22nd July",
                    time: "9:00 AM - 12:00 PM",
                  ),
                  ExamScheduleCard(
                    subject: "English Exam",
                    date: "24th July",
                    time: "9:00 AM - 12:00 PM",
                  ),
                  ExamScheduleCard(
                    subject: "History Exam",
                    date: "26th July",
                    time: "9:00 AM - 12:00 PM",
                  ),
                  ExamScheduleCard(
                    subject: "Geography Exam",
                    date: "28th July",
                    time: "9:00 AM - 12:00 PM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamScheduleCard extends StatelessWidget {
  final String subject;
  final String date;
  final String time;

  const ExamScheduleCard({
    Key? key,
    required this.subject,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              date,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HolidayNoticeDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const HolidayNoticeDetailPage({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification['title']!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0077B6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              notification['description']!,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Holiday Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "The school will remain closed on 14th August due to Independence Day. Enjoy the holiday and celebrate the spirit of independence!",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeReminderDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const FeeReminderDetailPage({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification['title']!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0077B6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              notification['description']!,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Fee Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Please pay the fee for the upcoming semester by the end of this month. The fee structure is as follows:",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16.0),
            FeeDetailCard(
              feeType: "Tuition Fee",
              amount: "Rs. 30,000",
              dueDate: "31st July",
            ),
            FeeDetailCard(
              feeType: "Library Fee",
              amount: "Rs. 2,000",
              dueDate: "31st July",
            ),
            FeeDetailCard(
              feeType: "Lab Fee",
              amount: "Rs. 3,000",
              dueDate: "31st July",
            ),
          ],
        ),
      ),
    );
  }
}

class FeeDetailCard extends StatelessWidget {
  final String feeType;
  final String amount;
  final String dueDate;

  const FeeDetailCard({
    Key? key,
    required this.feeType,
    required this.amount,
    required this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feeType,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              dueDate,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SportsDayDetailPage extends StatelessWidget {
  final Map<String, String> notification;

  const SportsDayDetailPage({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          notification['title']!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0077B6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              notification['description']!,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Sports Day Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Sports Day will be held on 20th July. Participate and show your skills in various sports events such as:",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16.0),
            SportsEventCard(
              event: "100m Race",
              time: "9:00 AM",
            ),
            SportsEventCard(
              event: "Football Match",
              time: "11:00 AM",
            ),
            SportsEventCard(
              event: "Cricket Match",
              time: "2:00 PM",
            ),
          ],
        ),
      ),
    );
  }
}

class SportsEventCard extends StatelessWidget {
  final String event;
  final String time;

  const SportsEventCard({
    Key? key,
    required this.event,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Color(0xFF0077B6),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
