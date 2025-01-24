import 'package:flutter/material.dart';

class MyCoursesScreen extends StatefulWidget {
  final List<Map<String, String>> myCourses;

  MyCoursesScreen({required this.myCourses});

  @override
  _MyCoursesScreenState createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  void _removeCourse(Map<String, String> course) {
    setState(() {
      widget.myCourses.remove(course);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${course['title']} removed from My Courses!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: widget.myCourses.isEmpty
          ? Center(child: Text('No courses added to My Courses'))
          : ListView.builder(
        itemCount: widget.myCourses.length,
        itemBuilder: (context, index) {
          final course = widget.myCourses[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 8.0,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  course['imageUrl']!,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(course['title']!),
              subtitle: Text(course['description']!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeCourse(course),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // My Courses tab is active
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
            // Already on My Courses
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
