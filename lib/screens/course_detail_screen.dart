import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final Map<String, String> course;
  final List<Map<String, String>> myCourses;

  CourseDetailScreen({required this.course, required this.myCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course['title']!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    course['imageUrl']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                course['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(course['description']!),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (!myCourses.contains(course)) {
                    myCourses.add(course);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Course added to My Courses!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Course already in My Courses!')),
                    );
                  }
                },
                child: Text('Start Learning'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
