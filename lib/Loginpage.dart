import 'package:college_app/Signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false; // Boolean to track password visibility

  @override
  void initState() {
    super.initState();
    _passwordVisible = false; // Initial state of password visibility is false (hidden)
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Adjusts the screen when the keyboard appears
        body: SingleChildScrollView( // Allows the screen to scroll when there is overflow
          child: Stack( // Allows widgets to be layered on top of each other
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xff1b9bda),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(500, 500),
                  ),
                ),
              ),
              Column( // Main column to hold the form and other widgets
                children: [
                  SizedBox(height: 130), // Space at the top of the screen
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16), // Margin around the container
                    padding: EdgeInsets.all(16), // Padding inside the container
                    decoration: BoxDecoration( // Styling the container
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      color: Colors.white, // White background
                      boxShadow: [ // Box shadow for elevation
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 10, // Blur radius of the shadow
                          offset: Offset(0, 5), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column( // Column to hold form fields and buttons
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the form field
                            child: TextFormField( // Email field
                              decoration: InputDecoration( // Styling the email field
                                labelText: 'Email', // Label text
                                border: OutlineInputBorder( // Border styling
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                enabledBorder: OutlineInputBorder( // Border styling when enabled
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.email, color: Color(0xff1b9bda)), // Email icon
                                labelStyle: TextStyle(color: Color(0xff1b9bda)), // Label color
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)), // Text color
                              validator: (value) { // Validator for the email field
                                if (value == null || value.isEmpty) { // Check if email is empty
                                  return 'Please enter your email';
                                }
                                String pattern = r'^[^@]+@gmail\.com$'; // Email pattern for validation
                                RegExp regex = RegExp(pattern); // Regex for validation
                                if (!regex.hasMatch(value)) { // Check if email is valid
                                  return 'Please enter a valid Email address';
                                }
                                return null; // No error if email is valid
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the form field
                            child: TextFormField( // Password field
                              decoration: InputDecoration( // Styling the password field
                                labelText: 'Password', // Label text
                                border: OutlineInputBorder( // Border styling
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                enabledBorder: OutlineInputBorder( // Border styling when enabled
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff1b9bda),
                                  ),
                                ),
                                suffixIcon: IconButton( // Visibility toggle icon
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Color(0xff1b9bda),
                                  ),
                                  onPressed: () { // Toggle password visibility
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)), // Label color
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)), // Text color
                              obscureText: !_passwordVisible, // Obscure text based on visibility
                              validator: (value) { // Validator for the password field
                                if (value == null || value.isEmpty) { // Check if password is empty
                                  return 'Please enter your password';
                                }
                                return null; // No error if password is not empty
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0), // Padding around the button
                            child: ElevatedButton( // Login button
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) { // Validate form
                                  // Process data
                                }
                              },
                              child: Text('Login', style: TextStyle(color: Colors.white)), // Button text
                              style: ElevatedButton.styleFrom( // Button styling
                                backgroundColor: Color(0xff1b9bda), // Background color
                                shape: RoundedRectangleBorder( // Button shape
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              ),
                            ),
                          ),
                          TextButton( // Signup button
                            onPressed: () { // Navigate to signup page
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Signuppage()));
                            },
                            child: Text(
                              'Don\'t have an account? Register', // Button text
                              style: TextStyle(color: Color(0xff1b9bda)), // Text color
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
