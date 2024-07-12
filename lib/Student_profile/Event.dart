import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Event',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF0077B6),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                EventCard(
                  eventName: '14th August',
                  eventDate: 'August 14, 2024',
                  eventDescription: 'Celebration of Independence Day.',
                  eventImage: 'assets/images/14August.jpg',
                ),
                EventCard(
                  eventName: 'Eid ul Adha',
                  eventDate: 'July 20, 2024',
                  eventDescription: 'Festival of Sacrifice.',
                  eventImage: 'assets/images/Eid-ul-Adha.jpg',
                ),
                EventCard(
                  eventName: 'Color Day',
                  eventDate: 'April 15, 2024',
                  eventDescription: 'Celebration of colors and fun.',
                  eventImage: 'assets/images/Colorday.jpg',
                ),
                EventCard(
                  eventName: 'Eid ul Fitr',
                  eventDate: 'May 3, 2024',
                  eventDescription: 'Festival marking the end of Ramadan.',
                  eventImage: 'assets/images/Eid-ul-Fitr.jpg',
                ),
                EventCard(
                  eventName: 'Sports Day',
                  eventDate: 'June 5, 2024',
                  eventDescription: 'Annual sports event.',
                  eventImage: 'assets/images/Sportsday.png',
                ),
                // Add more EventCard widgets for additional events
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventDescription;
  final String eventImage;

  const EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventDescription,
    required this.eventImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                eventImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0077B6),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Date: $eventDate',
                    style: TextStyle(
                      color: Color(0xFF0077B6),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    eventDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0077B6),
                    ),
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
