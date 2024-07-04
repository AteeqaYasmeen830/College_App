import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  var ww = 'semdep';
  var optionsSem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  var _currentItemSelectedSem = '1'; // Initial value set to first option
  var optionsDep = ['BS IT', 'BS Eng', 'BS Math'];
  var _currentItemSelectedDep = 'BS IT'; // Initial value set to first option
  List<String> present = [];
  List<String> absent = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff006769).withOpacity(0.9),
                Color(0xFFA4EAFE).withOpacity(0.9),
                Color(0xffa4c7c7).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent, // Set the Scaffold background to transparent
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentPage(
                      present: present,
                      absent: absent,
                      clas: ww,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.send,
              ),
            ),
            appBar: AppBar(
              backgroundColor:  Color(0xFFA4EAFE).withOpacity(0.9),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Attendance Page',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
                  ),
                  SizedBox(width: 15),
                  Flexible( // Wrap DropdownButton in Flexible
                    child: DropdownButton<String>(
                      dropdownColor:Colors.white,
                      isDense: true,
                      isExpanded: true, // Set isExpanded to true
                      items: optionsSem.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'RobotoSlab-VariableFont',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          _currentItemSelectedSem = newValueSelected!;
                          ww = _currentItemSelectedSem + _currentItemSelectedDep;
                        });
                        print(ww);
                      },
                      value: _currentItemSelectedSem,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible( // Wrap DropdownButton in Flexible
                    child: DropdownButton<String>(

                      isDense: true,
                      isExpanded: true, // Set isExpanded to true
                      items: optionsDep.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'RobotoSlab-VariableFont',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected1) {
                        setState(() {
                          _currentItemSelectedDep = newValueSelected1!;
                          ww = _currentItemSelectedSem + _currentItemSelectedDep;
                        });
                        print(ww);
                      },
                      value: _currentItemSelectedDep,
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                List<String> studentNames = [
                  'Mahrukh', 'Attika', 'Ezza', 'Hadia', 'Anum',
                  'Ayesha', 'Saba', 'Zaineb', 'Sehar', 'Noor'
                ];
                String name = studentNames[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (present.contains(name)) {
                        present.remove(name);
                        absent.add(name);
                      } else if (absent.contains(name)) {
                        absent.remove(name);
                        present.add(name);
                      } else {
                        present.add(name);
                      }
                    });
                    print("Present: $present");
                    print("Absent: $absent");
                  },
                  child: Card(
                    color: Color(0xff006769).withOpacity(1),
                    child: ListTile(
                      title: Text(name),
                      trailing: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: present.contains(name)
                              ? Color.fromARGB(255, 0, 228, 8)
                              : absent.contains(name)
                              ? Color.fromARGB(255, 248, 20, 4)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            present.contains(name)
                                ? 'Present'
                                : absent.contains(name)
                                ? 'Absent'
                                : 'Mark',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'RobotoSlab-VariableFont',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

  }
}

class AssignmentPage extends StatelessWidget {
  final List<String> present;
  final List<String> absent;
  final String clas;

  const AssignmentPage(
      {required this.present, required this.absent, required this.clas, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff006769).withOpacity(0.9),
            Color(0xFFA4EAFE).withOpacity(0.9),
            Color(0xffa4c7c7).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Text(
                      'Attendance Page',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab-VariableFont',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff006769).withOpacity(1),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Class: $clas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'RobotoSlab-VariableFont',
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff006769).withOpacity(1),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  children: [
                    Text(
                      'Present:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab-VariableFont',
                      ),
                    ),
                    ...present.map((student) =>
                        ListTile(
                          title: Text(
                            student,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    SizedBox(height: 10),
                    Text(
                      'Absent:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab-VariableFont',
                      ),
                    ),
                    ...absent.map((student) =>
                        ListTile(
                          title: Text(
                            student,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}