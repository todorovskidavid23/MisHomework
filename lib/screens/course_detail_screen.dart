import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final Map<String, String> course;
  final List<Map<String, String>> myCourses;

  CourseDetailScreen({required this.course, required this.myCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          course['title']!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  course['imageUrl']!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Card Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title
                    Text(
                      course['title']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Rating and Learners Row
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text('4.6', style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Text(
                          '10.5k Learners',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Duration and Level Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey, size: 20),
                            const SizedBox(width: 4),
                            Text('6 Hours', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.bar_chart, color: Colors.grey, size: 20),
                            const SizedBox(width: 4),
                            Text('Beginner', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Course Description
                    Text(
                      course['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Start Learning Button
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
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
