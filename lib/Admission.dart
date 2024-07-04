import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class Admission extends StatefulWidget {
  @override
  _AdmissionState createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  final _formKey = GlobalKey<FormState>();
  final _dobController = TextEditingController();
  final _paymentReferenceController = TextEditingController();
  bool _agreeToTerms = false;
  String? _selectedGender;
  String? _selectedCourse;
  String? _selectedPaymentMethod;
  File? _selectedPicture;
  List<File> _selectedDocuments = [];

  @override
  void dispose() {
    _dobController.dispose();
    _paymentReferenceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedPicture = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        _selectedDocuments = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  void _removePicture() {
    setState(() {
      _selectedPicture = null;
    });
  }

  void _removeDocument(int index) {
    setState(() {
      _selectedDocuments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admission', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff006769),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff006769).withOpacity(0.9),
                  Color(0xFFA4EAFE).withOpacity(0.9),
                  Color(0xffa4c7c7).withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.7),
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Admission Form',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff006769),
                            ),
                          ),
                          SizedBox(height: 20),
                          buildTextField('Name'),
                          buildTextField('Father name'),
                          buildEmailField(),
                          buildTextField('Phone Number', keyboardType: TextInputType.phone),
                          buildTextField('Address'),
                          buildDateField(context),
                          buildDropdownField('Gender', ['Male', 'Female', 'Other'], (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          }, _selectedGender),
                          buildDropdownField('Course', ['BSIT', 'BSCS', 'BSPhy', 'BSEng','BSMath','BSPsy','BSIsl'], (value) {
                            setState(() {
                              _selectedCourse = value;
                            });
                          }, _selectedCourse),
                          SizedBox(height: 10),
                          Text(
                            'Upload Picture',
                            style: TextStyle(color: Color(0xff006769), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: Text('Select Picture', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff006769)),
                          ),
                          _selectedPicture != null
                              ? Column(
                            children: [
                              Image.file(_selectedPicture!, height: 100, width: 100),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: _removePicture,
                              ),
                            ],
                          )
                              : Container(),
                          SizedBox(height: 20),
                          Text(
                            'Upload Documents',
                            style: TextStyle(color: Color(0xff006769), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _pickDocuments,
                            child: Text('Select Documents', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff006769)),
                          ),
                          _selectedDocuments.isNotEmpty
                              ? Column(
                            children: _selectedDocuments.map((file) {
                              int index = _selectedDocuments.indexOf(file);
                              return ListTile(
                                title: Text(file.path.split('/').last, style: TextStyle(color: Color(0xff006769))),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _removeDocument(index),
                                ),
                              );
                            }).toList(),
                          )
                              : Container(),
                          SizedBox(height: 20),
                          buildDropdownField('Payment Method', ['JazzCash', 'EasyPaisa', 'Bank Transfer'], (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          }, _selectedPaymentMethod),
                          if (_selectedPaymentMethod != null) buildPaymentReferenceField(),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Process data
                                }
                              },
                              child: Text('Submit', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff006769), // Background color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff006769)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff006769),
            ),
          ),
        ),
        style: TextStyle(color: Color(0xff006769)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(color: Color(0xff006769)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff006769),
            ),
          ),
        ),
        style: TextStyle(color: Color(0xff006769)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Email';
          }
          if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
            return 'Please enter a valid Email address';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDateField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _dobController,
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          labelStyle: TextStyle(color: Color(0xff006769)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff006769),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today, color: Color(0xff006769)),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                });
              }
            },
          ),
        ),
        style: TextStyle(color: Color(0xff006769)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Date of Birth';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDropdownField(String labelText, List<String> items, ValueChanged<String?> onChanged, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff006769)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff006769),
            ),
          ),
        ),
        value: selectedValue,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            if (labelText == 'Gender') {
              _selectedGender = value;
            } else if (labelText == 'Course') {
              _selectedCourse = value;
            } else if (labelText == 'Payment Method') {
              _selectedPaymentMethod = value;
            }
          });
          onChanged(value);
        },
        style: TextStyle(color: Color(0xff006769)),
        validator: (value) {
          if (value == null) {
            return 'Please select your $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget buildPaymentReferenceField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: _pickDocuments,
            child: Text('Attach Challan', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff006769)),
          ),
        ),
      ],
    );
  }
}
