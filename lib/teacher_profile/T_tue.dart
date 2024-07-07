import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrNames = ['Economics', 'Network Security', 'Break', 'Project', ''];
    var number = [
      '8:00AM - 9:00AM',
      '9:00AM - 10:00AM',
      '10:00AM - 10:30AM',
      '10:30AM - 12:00PM',
      ''
    ];
    var arrNamesTeachers = ['Mam Salsabeel', 'Mam Nida', 'Break', 'Mam Rameesha'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tuesday',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                arrNames[index],
                style: TextStyle( color: Color(0xFF00B0FF),),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number[index],
                    style: TextStyle( color: Color(0xFF00B0FF),),
                  ),
                  if (arrNamesTeachers.length > index) // Avoid out of range error
                    Text(
                      arrNamesTeachers[index],
                      style: TextStyle( color: Color(0xFF00B0FF),),
                    ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Color(0xFF00B0FF),
              height: 20,
              thickness: 2,
            );
          },
          itemCount: arrNames.length,
        ),
      ),
    );
  }
}
