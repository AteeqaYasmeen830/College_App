import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Viewprofile extends StatefulWidget {
  final Function(String) onImageChanged;

  Viewprofile({required this.onImageChanged});

  @override
  _ViewprofileState createState() => _ViewprofileState();
}

class _ViewprofileState extends State<Viewprofile> {
  late SharedPreferences _prefs;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    String? imagePath = _prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _prefs.setString('profile_image', pickedFile.path);
      widget.onImageChanged(pickedFile.path); // Notify Studentpage of image change
    }
  }

  Future<void> _deleteImage() async {
    setState(() {
      _imageFile = null;
    });
    await _prefs.remove('profile_image');
    widget.onImageChanged(''); // Notify Studentpage of image change
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1b9bda), // Updated color
          title: Text('View Profile', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _showImagePicker(context);
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300], // Placeholder background color
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage('assets/images/defaultProfile.png') as ImageProvider,
                  child: _imageFile == null
                      ? Icon(Icons.person, size: 50, color: Colors.white) // Placeholder icon
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Text('Change Profile Image'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteImage,
                child: Text('Delete Profile Image',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1b9bda), // Updated color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a Photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
