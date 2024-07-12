import 'package:college_app/teacher_profile/T_attendence.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();

  var selectedSem = 'Sem';
  var selectedDep = 'Dep';
  var optionsSem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  var optionsDep = ['BS IT', 'BS Eng', 'BS Math'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double circleWidth = constraints.maxWidth * 1;
                double circleHeight = constraints.maxHeight * 1.1;

                return Stack(
                  children: [
                    Container(
                     color: Colors.white,
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.17,
                      right: -constraints.maxWidth * 0.05,
                      child: Container(
                        width: 192,
                        height: 202,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Color(0xFF00B0FF)
                        ),
                      ),
                    ),
                    Positioned(
                      top: -circleHeight * 0.4,
                      left: -circleWidth * 0.3,
                      child: Container(
                        width: circleWidth,
                        height: circleHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Color(0xFF00B0FF),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 50),  // Increase the height to move the container down
                  Text(
                    'Add a Student',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoSlab-VariableFont',
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.only(top: 30),  // Add margin to move the container down
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(border: Border.all()),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(border: Border.all()),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: rollNumberController,
                                  decoration: InputDecoration(
                                    hintText: 'Roll Number',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dep: ',
                                    style: TextStyle(
                                      color: Color(0xFF00B0FF),
                                      fontSize: 25,
                                      fontFamily: 'RobotoSlab-VariableFont',
                                    ),
                                  ),
                                  Flexible(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      dropdownColor: Colors.white,
                                      items: optionsDep.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedDep = newValue!;
                                        });
                                      },
                                      value: selectedDep == 'Dep'
                                          ? null
                                          : selectedDep,
                                      hint: Text(
                                        'Dep',
                                        style: TextStyle(
                                          color: Color(0xFF00B0FF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  Text(
                                    'Sem: ',
                                    style: TextStyle(
                                      color: Color(0xFF00B0FF),
                                      fontSize: 25,
                                      fontFamily: 'RobotoSlab-VariableFont',
                                    ),
                                  ),
                                  Flexible(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      dropdownColor: Colors.white,
                                      items: optionsSem.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedSem = newValue!;
                                        });
                                      },
                                      value: selectedSem == 'Sem'
                                          ? null
                                          : selectedSem,
                                      hint: Text(
                                        'Sem',
                                        style: TextStyle(
                                          color: Color(0xFF00B0FF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              MaterialButton(
    color: Color(0xFF00B0FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AttendenceT(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'ADD',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoSlab-VariableFont',
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
