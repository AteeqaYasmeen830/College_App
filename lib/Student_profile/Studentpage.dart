import 'dart:io'; // For File operations
import 'package:flutter/material.dart'; // Flutter framework
import 'package:shared_preferences/shared_preferences.dart'; // For persisting data locally
import 'Admission.dart'; // Importing Admission page
import 'AppDrawer.dart'; // Importing AppDrawer widget
import 'Attendance.dart'; // Importing Attendance page
import 'Community.dart'; // Importing Community page
import 'Courses.dart'; // Importing Courses page
import 'Event.dart'; // Importing Event page
import 'Fee.dart'; // Importing Fee page
import 'Notifications.dart'; // Importing Notifications page
import 'Timetable.dart'; // Importing Timetable page
import 'Viewprofile.dart'; // Importing Viewprofile page

class Studentpage extends StatefulWidget {
  @override
  _StudentpageState createState() => _StudentpageState();
}

class _StudentpageState extends State<Studentpage> {
  late SharedPreferences _prefs; // To store instance of SharedPreferences
  String _currentProfileImagePath = ''; // To store the current profile image path
  int _selectedIndex = 0; // To store the index of selected tab in BottomNavigationBar

  @override
  void initState() {
    super.initState();
    _initSharedPreferences(); // Initialize SharedPreferences when the state is created
  }

  // Initialize SharedPreferences and load the saved profile image path
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadImageFromPrefs();
  }

  // Load the saved profile image path from SharedPreferences
  Future<void> _loadImageFromPrefs() async {
    String? imagePath = _prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _currentProfileImagePath = imagePath;
      });
    }
  }

  // Update the profile image path and save it in SharedPreferences
  void _updateImage(String newImagePath) {
    setState(() {
      _currentProfileImagePath = newImagePath;
    });
    _prefs.setString('profile_image', newImagePath);
  }

  // Update the selected index for BottomNavigationBar and navigate to corresponding page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateToSelectedPage(index);
  }

  // Navigate to the selected page
  void _navigateToSelectedPage(int index) {
    Widget selectedPage;
    if (index == 1) {
      selectedPage = Notifications();
    } else if (index == 2) {
      selectedPage = Community();
    } else {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedPage),
    ).then((_) {
      // When coming back, always set the index back to home (0)
      setState(() {
        _selectedIndex = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of pages for BottomNavigationBar
    List<Widget> _pages = [
      HomePage(
        onImageChanged: _updateImage,
        currentProfileImagePath: _currentProfileImagePath,
        onDrawerOptions: _showDrawerOptions,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: _pages[0], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1b9bda), // Background color for BottomNavigationBar
          unselectedItemColor: Colors.white, // Unselected item color
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
          ],
          currentIndex: _selectedIndex, // Current selected index
          onTap: _onItemTapped, // Callback when an item is tapped
        ),
      ),
    );
  }

  // Show the AppDrawer as a bottom sheet
  void _showDrawerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AppDrawer(
          profileImagePath: _currentProfileImagePath,
          onImageChanged: _updateImage,
          studentName: 'Ateeqa Yasmeen',
          onProfileImageClick: () {
            Navigator.pop(context); // Close the drawer when profile image is clicked
          },
        );
      },
    );
  }
}

// HomePage widget
class HomePage extends StatelessWidget {
  final void Function(String) onImageChanged; // Callback to update the image
  final String currentProfileImagePath; // Current profile image path
  final VoidCallback onDrawerOptions; // Callback to show drawer options

  HomePage({
    required this.onImageChanged,
    required this.currentProfileImagePath,
    required this.onDrawerOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(), // Background decoration
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Center(
                  child: GestureDetector(
                    onTap: onDrawerOptions,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey[300], // Placeholder background color
                      backgroundImage: currentProfileImagePath.isNotEmpty
                          ? FileImage(File(currentProfileImagePath)) // Display image from file if available
                          : AssetImage('assets/images/defaultProfile.png') as ImageProvider, // Default profile image
                      child: currentProfileImagePath.isEmpty
                          ? Icon(Icons.person, size: 60, color: Colors.white) // Placeholder icon if no image
                          : null,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              buildProfileCard(context), // Profile card widget
              Expanded(
                child: SingleChildScrollView(
                  child: buildGrid(context), // Grid of options
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Background decoration for HomePage
  Widget buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFFF0F8FF),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xff1b9bda),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile card widget
  Widget buildProfileCard(BuildContext context) {
    return Center(
      child: Container(
        height: 75,
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('Ateeqa Yasmeen', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Grid of options (Admission, Event, Fee, etc.)
  Widget buildGrid(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17, left: 30, right: 30, bottom: 9),
      child: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        shrinkWrap: true, // Shrink wrap to fit the content
        physics: NeverScrollableScrollPhysics(), // Disable scrolling for the grid
        children: [
          buildGridItem(context, Icons.add_task, 'Admission', Admission()), // Admission grid item
          buildGridItem(context, Icons.event, 'Event', Event()), // Event grid item
          buildGridItem(context, Icons.fact_check_sharp, 'Fee', Fee()), // Fee grid item
          buildGridItem(context, Icons.access_alarm, 'Timetable', Timetable()), // Timetable grid item
          buildGridItem(context, Icons.perm_contact_calendar_outlined, 'Attendance', Attendance()), // Attendance grid item
          buildGridItem(context, Icons.calendar_month, 'Courses', Courses()), // Courses grid item
        ],
      ),
    );
  }

  // Grid item widget
  Widget buildGridItem(BuildContext context, IconData icon, String title, Widget page) {
    return InkWell(
      onTap: () {
        if (title == 'View Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Viewprofile(
                onImageChanged: onImageChanged,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10, // Blur effect
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Color(0xff1b9bda)), // Icon for the grid item
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Title for the grid item
          ],
        ),
      ),
    );
  }
}
