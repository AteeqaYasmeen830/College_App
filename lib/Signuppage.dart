import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Loginpage.dart';
import 'package:college_app/Student_profile/Studentpage.dart';
import 'package:college_app/teacher_profile/page_teacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false; // Boolean to track password visibility

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initially setting password visibility to false
  }

  Future<void> _register(String role) async {
    if (_formKey.currentState?.validate() == true) {
      try {
        // Create a new user with Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Save user profile information to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'name': _nameController.text,
          'email': _emailController.text,
          'role': role,
        });

        // Navigate to the appropriate page based on role
        if (role == 'Student') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Studentpage(name: _nameController.text)),
          );
        } else if (role == 'Teacher') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TeacherPage(name: _nameController.text)),
          );
        }
      } catch (e) {
        print("Error registering user: $e");
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Allows bottom inset adjustment
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Loginpage()), // Navigate to Signup page
              );
            },
          ),
          backgroundColor: Color(0xff1b9bda), // AppBar background color
          elevation: 0, // No shadow for AppBar
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xff1b9bda), // Background color
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(500, 500), // Curved border
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 100), // Space from top
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30), // Space between title and form
                  Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16), // Form container margin
                    padding:
                        EdgeInsets.all(16), // Padding inside form container
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
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
                            padding: const EdgeInsets.all(
                                5.0), // Email field padding
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.email,
                                    color: Color(0xff1b9bda)), // Email icon
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(
                                  color: Color(0xff1b9bda)), // Text style
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Gmail';
                                }
                                String pattern =
                                    r'^[^@]+@gmail\.com$'; // Regex for Gmail validation
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'Please enter a valid Gmail address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                                5.0), // Password field padding
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
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
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0xff1b9bda),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible =
                                          !_passwordVisible; // Toggle password visibility
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(
                                  color: Color(0xff1b9bda)), // Text style
                              obscureText:
                                  !_passwordVisible, // Password visibility toggle
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(5.0), // Name field padding
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.person,
                                    color: Color(0xff1b9bda)), // Name icon
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(
                                  color: Color(0xff1b9bda)), // Text style
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                              height: 10), // Space between fields and buttons
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _register('Student'); // Register as Student
                                  },
                                  child: Text('SignUp as Student',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 15), // Button padding
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _register('Teacher'); // Register as Teacher
                                  },
                                  child: Text('SignUp as Teacher',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 15), // Button padding
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Space between buttons and login link
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Loginpage()), // Navigate to login page
                              );
                            },
                            child: Text('Already have an account? Login',
                                style: TextStyle(color: Color(0xff1b9bda))),
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
