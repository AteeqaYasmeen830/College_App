import 'dart:io';
import 'package:college_app/teacher_profile/upload_assignment.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent)),
      title: 'New WhatsApp UI',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor:  Color(0xFF00B0FF),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 10),
                    children: [
                      TextButton(
                        onPressed: () {

                        },
                        child: const Text(
                          "Messages",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      const SizedBox(width: 35),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => upload_assignments(),
                            ),
                          );
                        },
                        child: const Text(
                          "Upload assignments",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      const SizedBox(width: 35),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Groups",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      const SizedBox(width: 35),

                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),]
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildConversationRow('Mahrukh', 'Hello, how are you', 'img1.jpeg', 0),
                      buildConversationRow('Attika', 'Will you visit me', 'img2.jpeg', 2),
                      buildConversationRow('Ezza', 'I ate your ...', 'img3.jpeg', 6),
                      buildConversationRow('Anum', 'Are you with Kayla again', 'img5.jpeg', 0),
                      buildConversationRow('Hadia', 'Borrow money please', 'img6.jpeg', 3),
                      buildConversationRow('Ayesha', 'Hey, whatsup', 'img7.jpeg', 0),
                      buildConversationRow('Zaineb', 'Hello, how are you', 'img1.jpeg', 0),
                      buildConversationRow('Sehar', 'Hello, how are you', 'img1.jpeg', 0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor:  Color(0xFF00B0FF),
          child: const Icon(
            Icons.edit_outlined,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Column buildConversationRow(String name, String message, String filename, int msgCount) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(filename: filename),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 5),
              child: Column(
                children: [
                  const Text(
                    '16:35',
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 15),
                  if (msgCount > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: const Color(0xFF27c1a9),
                      child: Text(
                        '$msgCount',
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            height: 1,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column buildContactAvatar(String name, String filename) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/$filename'),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class UserAvatar extends StatefulWidget {
  final String filename;

  const UserAvatar({required this.filename});

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  Future<void> _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('user_avatar');
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_avatar', pickedFile.path);
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : AssetImage('assets/${widget.filename}') as ImageProvider,
      ),
    );
  }
}

void main() {
  runApp(CommunityT());
}
