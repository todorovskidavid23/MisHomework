import 'package:flutter/material.dart';
import '../widgets/course_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> myCourses;

  const HomeScreen({required this.myCourses});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> courses = [
    {
      'title': 'Landscape Photography',
      'description': 'Learn the art of landscape photography.',
      'imageUrl': 'https://untamedscience.com/wp-content/uploads/2021/03/landscape-photography-tips-tripod-1.jpg',
    },
    {
      'title': 'Wedding Photography',
      'description': 'Master wedding photography techniques.',
      'imageUrl': 'https://www.photojaanic.com/blog/wp-content/uploads/sites/2/2017/03/00-Lead.jpg',
    },
    {
      'title': 'Wildlife Photography',
      'description': 'Explore the wild through your lens.',
      'imageUrl': 'https://i0.wp.com/onlinephotographytraining.com/wp-content/uploads/2020/01/Wildlife-Thumbnail.jpg?fit=1919%2C1082&ssl=1',
    },
    {
      'title': 'Travel Photography',
      'description': 'Capture your travel adventures beautifully.',
      'imageUrl': 'https://media.istockphoto.com/id/1034301914/photo/nature-photographer-norway-lofoten-archipelago.jpg?s=612x612&w=0&k=20&c=Ld-m38V3XfYKsiBtcYTdCfsNJNj7QgGjyGOxlHIU-a0=',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photography Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(course: course, myCourses: widget.myCourses);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
            // Already on Home
              break;
            case 1:
              Navigator.pushNamed(context, '/my_courses');
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
