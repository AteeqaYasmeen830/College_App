import 'package:college_app/teacher_profile/page_teacher.dart';
import 'package:flutter/material.dart';
import 'package:college_app/Loginpage.dart';
import 'Student_profile/Studentpage.dart';

class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form and its state
  bool _passwordVisible = false; // Boolean to track the visibility of the password

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initially setting the password visibility to false
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Allows the bottom inset to be adjusted when the keyboard appears
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xff1b9bda), // Background color of the container
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(500, 500), // Curved bottom-right border
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 130), // Space from the top
                  Text(
                    'Sign Up', // Title text
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30), // Space between title and form
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16), // Margin around the form container
                    padding: EdgeInsets.all(16), // Padding inside the form container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      color: Colors.white, // Background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5), // Shadow effect
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey, // Form key for validation
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the email field
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email', // Label for email field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.email, color: Color(0xff1b9bda)), // Email icon
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)), // Text style inside the field
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                String pattern = r'^[^@]+@gmail\.com$'; // Regex pattern for Gmail validation
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'Please enter a valid Email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the password field
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password', // Label for password field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Color(0xff1b9bda),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible; // Toggle password visibility
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)), // Text style inside the field
                              obscureText: !_passwordVisible, // Password obscured or visible based on the toggle
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the username field
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name', // Label for username field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.person, color: Color(0xff1b9bda)), // Username icon
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)), // Text style inside the field
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10), // Space between the username field and buttons
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Studentpage()), // Navigate to Studentpage on validation
                                      );
                                    }
                                  },
                                  child: Text('SignUp as Student', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15), // Button padding
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TeacherPage()), // Navigate to TeacherPage on validation
                                      );
                                    }
                                  },
                                  child: Text('SignUp as Teacher', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15), // Button padding
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10), // Space between the buttons and login link
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()), // Navigate to Loginpage
                              );
                            },
                            child: Text(
                              'Already have an account? Login', // Login link text
                              style: TextStyle(color: Color(0xff1b9bda)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
