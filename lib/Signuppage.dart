import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Loginpage.dart';
import 'package:college_app/Student_profile/Studentpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

<<<<<<< HEAD
class _SignuppageState extends State<Studentpage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Future<void> _register() async {
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
        });

        // Navigate to the Studentpage or TeacherPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Studentpage()), // Adjust navigation as needed
        );
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
=======
class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
<<<<<<< HEAD
                  color: Color(0xff1b9bda),
=======
                  color: Color(0xff087ebd),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(500, 500),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 130),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff087ebd),
                                  ),
                                ),
<<<<<<< HEAD
                                suffixIcon:
                                    Icon(Icons.email, color: Color(0xff1b9bda)),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)),
=======
                                suffixIcon: Icon(Icons.email, color: Color(0xff087ebd)),
                                labelStyle: TextStyle(color: Color(0xff087ebd)),
                              ),
                              style: TextStyle(color: Color(0xff087ebd)),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                String pattern = r'^[^@]+@gmail\.com$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'Please enter a valid Email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff087ebd),
                                  ),
                                ),
<<<<<<< HEAD
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0xff1b9bda),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)),
                              obscureText: !_passwordVisible,
=======
                                suffixIcon: Icon(Icons.lock, color: Color(0xff087ebd)),
                                labelStyle: TextStyle(color: Color(0xff087ebd)),
                              ),
                              style: TextStyle(color: Color(0xff087ebd)),
                              obscureText: true,
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
<<<<<<< HEAD
                                labelText: 'Name',
=======
                                labelText: 'User Name',
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0077B6),
                                  ),
                                ),
<<<<<<< HEAD
                                suffixIcon: Icon(Icons.person,
                                    color: Color(0xff1b9bda)),
                                labelStyle: TextStyle(color: Color(0xff1b9bda)),
                              ),
                              style: TextStyle(color: Color(0xff1b9bda)),
=======
                                suffixIcon: Icon(Icons.person, color: Color(0xFF0077B6)),
                                labelStyle: TextStyle(color: Color(0xFF0077B6)),
                              ),
                              style: TextStyle(color: Color(0xFF0077B6)),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
<<<<<<< HEAD
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: _register,
                                  child: Text('SignUp as Student',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 15),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: _register,
                                  child: Text('SignUp as Teacher',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1b9bda),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 15),
                                  ),
=======
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Role',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF0077B6)),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                                ),
                                labelStyle: TextStyle(color: Color(0xFF0077B6)),
                              ),
                              style: TextStyle(color: Color(0xFF0077B6)),
                              iconEnabledColor: Color(0xFF0077B6),
                              items: ['Student', 'Teacher']
                                  .map((role) => DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your role';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  if (_selectedRole == 'Student') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Studentpage()),
                                    );
                                  } else if (_selectedRole == 'Teacher') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TeacherPage()),
                                    );
                                  }
                                }
                              },
                              child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0077B6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              ),
                            ),
                          ),
<<<<<<< HEAD
                          SizedBox(height: 10),
=======
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
<<<<<<< HEAD
                                    builder: (context) => Loginpage()),
=======
                                    builder: (context) => Loginpage()
                                ),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
                              );
                            },
                            child: Text(
                              'Already have an account? Login',
<<<<<<< HEAD
                              style: TextStyle(color: Color(0xff1b9bda)),
=======
                              style: TextStyle(color: Color(0xFF0077B6)),
>>>>>>> 1b845b629a48934bfd8ea14c7315c7dc1577f810
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
