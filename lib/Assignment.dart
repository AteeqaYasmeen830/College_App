import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Assignment extends StatefulWidget {
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List<File> _files = [];

  @override
  void initState() {
    super.initState();
    _loadFiles(); // Load files when widget initializes
  }

  Future<void> _loadFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? filePaths = prefs.getStringList('filePaths');
    if (filePaths != null) {
      setState(() {
        _files = filePaths.map((path) => File(path)).toList();
      });
    }
  }

  Future<void> _saveFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> filePaths = _files.map((file) => file.path).toList();
    await prefs.setStringList('filePaths', filePaths);
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.where((path) => path != null).map((path) => File(path!)).toList();
      setState(() {
        _files.addAll(files);
      });
      await _saveFiles(); // Save files after adding
    }
  }

  Future<void> _deleteFile(File file) async {
    if (await file.exists()) {
      await file.delete();
      setState(() {
        _files.remove(file);
      });
      await _saveFiles(); // Save files after deletion
    }
  }

  void _openFile(File file) {
    OpenFile.open(file.path);
  }

  void _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _files.add(file);
      });
      await _saveFiles(); // Save files after adding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006769),
        title: Text(
          'Assignment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _files.isEmpty
                  ? Center(
                child: Text(
                  'No file selected',
                  style: TextStyle(fontSize: 20, color:Color(0xff006769)),
                ),
              )
                  : ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // Background color for each file entry
                    child: ListTile(
                      title: Text(
                        _files[index].path.split('/').last,
                        style: TextStyle(color: Color(0xff006769)),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteFile(_files[index]),
                      ),
                      onTap: () => _openFile(_files[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xff006769),
              ),
              child: ElevatedButton(
                onPressed: _uploadFile,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff006769),
                  backgroundColor: Colors.white, // Text color
                ),
                child: Text('Upload File'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
