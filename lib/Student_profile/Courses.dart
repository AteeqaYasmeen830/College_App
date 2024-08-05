import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final Map<String, Map<String, List<String>>> courses = {
    'BS IT': {
      'Semester 1': ['Introduction to IT', 'Programming Fundamentals', 'Mathematics'],
      'Semester 2': ['Data Structures', 'Digital Logic Design', 'Statistics'],
      'Semester 3': ['Database Systems', 'Operating Systems', 'Web Development'],
      'Semester 4': ['Computer Networks', 'Software Engineering', 'Discrete Mathematics'],
      'Semester 5': ['Artificial Intelligence', 'Computer Architecture', 'Human Computer Interaction'],
      'Semester 6': ['Machine Learning', 'Mobile Application Development', 'Cloud Computing'],
      'Semester 7': ['Network Security', 'Data Mining', 'Final Year Project I'],
      'Semester 8': ['Information Security', 'Big Data Analytics', 'Final Year Project II'],
    },
    'BS English': {
      'Semester 1': ['Introduction to Literature', 'English Grammar', 'History of English Literature'],
      'Semester 2': ['Poetry', 'Drama', 'Prose'],
      'Semester 3': ['Novel', 'Linguistics', 'Literary Criticism'],
      'Semester 4': ['American Literature', 'Phonetics', 'Semantics'],
      'Semester 5': ['Sociolinguistics', 'Psycholinguistics', 'Research Methods'],
      'Semester 6': ['Postcolonial Literature', 'Translation Studies', 'Modern Fiction'],
      'Semester 7': ['Comparative Literature', 'Creative Writing', 'Final Year Project I'],
      'Semester 8': ['English Language Teaching', 'World Literature', 'Final Year Project II'],
    },
    'BS Isl': {
      'Semester 1': ['Introduction to Islamic Studies', 'Quranic Studies', 'Hadith Studies'],
      'Semester 2': ['Islamic Jurisprudence', 'Seerah of the Prophet', 'Islamic History'],
      'Semester 3': ['Comparative Religion', 'Islamic Philosophy', 'Islamic Economics'],
      'Semester 4': ['Islamic Political Thought', 'Islamic Ethics', 'Islamic Civilization'],
      'Semester 5': ['Contemporary Issues in Islam', 'Islamic Law of Inheritance', 'Research Methodology'],
      'Semester 6': ['Islamic Banking', 'Islamic Education', 'Islam and Science'],
      'Semester 7': ['Advanced Quranic Studies', 'Advanced Hadith Studies', 'Final Year Project I'],
      'Semester 8': ['Islamic Theology', 'Islamic Culture', 'Final Year Project II'],
    },
    'BS CS': {
      'Semester 1': ['Introduction to Computer Science', 'Programming Fundamentals', 'Mathematics'],
      'Semester 2': ['Object-Oriented Programming', 'Digital Logic Design', 'Statistics'],
      'Semester 3': ['Algorithms', 'Operating Systems', 'Database Systems'],
      'Semester 4': ['Software Engineering', 'Computer Networks', 'Theory of Automata'],
      'Semester 5': ['Web Development', 'Artificial Intelligence', 'Human Computer Interaction'],
      'Semester 6': ['Data Science', 'Machine Learning', 'Cloud Computing'],
      'Semester 7': ['Network Security', 'Data Mining', 'Final Year Project I'],
      'Semester 8': ['Information Security', 'Big Data Analytics', 'Final Year Project II'],
    },
    'BS Psychology': {
      'Semester 1': ['Introduction to Psychology', 'Biopsychology', 'Developmental Psychology'],
      'Semester 2': ['Social Psychology', 'Cognitive Psychology', 'Research Methods'],
      'Semester 3': ['Abnormal Psychology', 'Psychometrics', 'Personality Psychology'],
      'Semester 4': ['Health Psychology', 'Educational Psychology', 'Experimental Psychology'],
      'Semester 5': ['Clinical Psychology', 'Counseling Psychology', 'Neuropsychology'],
      'Semester 6': ['Industrial Psychology', 'Forensic Psychology', 'Positive Psychology'],
      'Semester 7': ['Advanced Research Methods', 'Therapeutic Techniques', 'Final Year Project I'],
      'Semester 8': ['Psychological Assessment', 'Cross-Cultural Psychology', 'Final Year Project II'],
    },
    'BS Physics': {
      'Semester 1': ['Mechanics', 'Electricity and Magnetism', 'Calculus'],
      'Semester 2': ['Waves and Optics', 'Thermodynamics', 'Linear Algebra'],
      'Semester 3': ['Quantum Mechanics I', 'Electronics', 'Mathematical Physics'],
      'Semester 4': ['Quantum Mechanics II', 'Nuclear Physics', 'Statistical Mechanics'],
      'Semester 5': ['Solid State Physics', 'Electrodynamics', 'Classical Mechanics'],
      'Semester 6': ['Particle Physics', 'Condensed Matter Physics', 'Computational Physics'],
      'Semester 7': ['Plasma Physics', 'Advanced Quantum Mechanics', 'Final Year Project I'],
      'Semester 8': ['Relativity', 'Astrophysics', 'Final Year Project II'],
    },
    'BS Education': {
      'Semester 1': ['Foundations of Education', 'Educational Psychology', 'Curriculum Development'],
      'Semester 2': ['Instructional Strategies', 'Assessment and Evaluation', 'Educational Leadership'],
      'Semester 3': ['Educational Technology', 'Special Education', 'Classroom Management'],
      'Semester 4': ['Educational Research', 'Guidance and Counseling', 'Comparative Education'],
      'Semester 5': ['Sociology of Education', 'Philosophy of Education', 'History of Education'],
      'Semester 6': ['Education Policy', 'Teacher Education', 'Early Childhood Education'],
      'Semester 7': ['Educational Administration', 'Multicultural Education', 'Final Year Project I'],
      'Semester 8': ['Education and Society', 'Global Education', 'Final Year Project II'],
    },
  };

  final Map<String, String> departmentImages = {
    'BS IT': 'assets/bsit.jpg',
    'BS English': 'assets/bsenglish.jpg',
    'BS Isl': 'assets/bsisl.jpg',
    'BS CS': 'assets/bscs.jpg',
    'BS Psychology': 'assets/bspsychology.jpg',
    'BS Physics': 'assets/bsphysics.jpg',
    'BS Education': 'assets/bseducation.jpg',
  };

  final Map<String, String> subjectImages = {
    'Introduction to IT': 'assets/images/course outline.jpg',
    'Programming Fundamentals': 'assets/images/course outline.jpg',
    'Mathematics': 'assets/images/course outline.jpg',
    'Data Structures': 'assets/images/course outline.jpg',
    'Digital Logic Design': 'assets/images/course outline.jpg',
    'Statistics': 'assets/images/course outline.jpg',
    'Database Systems': 'assets/images/course outline.jpg',
    'Operating Systems': 'assets/images/course outline.jpg',
    'Web Development': 'assets/images/course outline.jpg',
    'Computer Networks': 'assets/images/course outline.jpg',
    'Software Engineering': 'assets/images/course outline.jpg',
    'Discrete Mathematics': 'assets/images/course outline.jpg',
    'Artificial Intelligence': 'assets/images/course outline.jpg',
    'Computer Architecture': 'assets/images/course outline.jpg',
    'Human Computer Interaction': 'assets/images/course outline.jpg',
    'Machine Learning': 'assets/images/course outline.jpg',
    'Mobile Application Development': 'assets/images/course outline.jpg',
    'Cloud Computing': 'assets/images/course outline.jpg',
    'Network Security': 'assets/images/course outline.jpg',
    'Data Mining': 'assets/images/course outline.jpg',
    'Final Year Project I': 'assets/images/course outline.jpg',
    'Final Year Project II': 'assets/images/course outline.jpg',
    'Foundations of Education': 'assets/images/course outline.jpg',
    'Educational Psychology': 'assets/images/course outline.jpg',
    'Curriculum Development': 'assets/images/course outline.jpg',
    // Add similar entries for other subjects from different departments...
  };

  String? selectedDepartment;
  String? selectedSemester;
  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1b9bda), // Updated color
          title: Text(
            'Courses',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    if (selectedSubject != null) {
      return buildSubjectView();
    } else if (selectedSemester != null) {
      return buildSemesterView();
    } else if (selectedDepartment != null) {
      return buildDepartmentView();
    } else {
      return buildCourseListView();
    }
  }

  Widget buildCourseListView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1b9bda).withOpacity(0.6), // Updated color
            Colors.white.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.builder(
        itemCount: courses.keys.length,
        itemBuilder: (context, index) {
          String department = courses.keys.elementAt(index);
          Map<String, List<String>> semesters = courses[department]!;
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ExpansionTile(
              title: Text(
                department,
                style: TextStyle(color: Color(0xff1b9bda), fontWeight: FontWeight.bold), // Updated color
              ),
              iconColor: Color(0xff1b9bda), // Updated color
              collapsedIconColor: Color(0xff1b9bda), // Updated color
              children: semesters.keys.map((semester) {
                return ListTile(
                  title: Text(
                    semester,
                    style: TextStyle(color: Color(0xff1b9bda)), // Updated color
                  ),
                  onTap: () {
                    setState(() {
                      selectedDepartment = department;
                      selectedSemester = semester;
                    });
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget buildDepartmentView() {
    List<String> semesters = courses[selectedDepartment]!.keys.toList();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          String semester = semesters[index];
          List<String> subjects = courses[selectedDepartment]![semester]!;
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ExpansionTile(
              title: Text(
                semester,
                style: TextStyle(color: Color(0xff1b9bda),fontWeight: FontWeight.bold), // Updated color
              ),
              iconColor: Color(0xff1b9bda), // Updated color
              collapsedIconColor: Color(0xff1b9bda), // Updated color
              children: subjects.map((subject) {
                return ListTile(
                  title: Text(
                    subject,
                    style: TextStyle(color: Color(0xff1b9bda)), // Updated color
                  ),
                  onTap: () {
                    setState(() {
                      selectedSubject = subject;
                    });
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget buildSemesterView() {
    List<String> subjects = courses[selectedDepartment]![selectedSemester]!;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          String subject = subjects[index];
          return ListTile(
            title: Text(
              subject,
              style: TextStyle(color: Color(0xff1b9bda)), // Updated color
            ),
            onTap: () {
              setState(() {
                selectedSubject = subject;
              });
            },
          );
        },
      ),
    );
  }

  Widget buildSubjectView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSubject = null;
            selectedSemester = null;
            selectedDepartment = null;
          });
        },
        child: subjectImages.containsKey(selectedSubject)
            ? Image.asset(
          subjectImages[selectedSubject]!,
        )
            : Center(
          child: Text(
            'No image available',
            style: TextStyle(color: Color(0xff1b9bda), fontSize: 18), // Updated color
          ),
        ),
      ),
    );
  }
}
