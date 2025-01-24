import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),

        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('New Here? Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Register',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  final List<Map<String, String>> myCourses = [];

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
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 8.0,
            child: Container(
              height: 200,
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(course: course),
                    ),
                  );
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        course['imageUrl']!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            course['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            course['description']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.book, color: myCourses.contains(course) ? Colors.red : Colors.grey),
                      onPressed: () {
                        setState(() {
                          if (myCourses.contains(course)) {
                            myCourses.remove(course);
                          } else {
                            myCourses.add(course);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
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
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCoursesScreen(myCourses: myCourses),
                ),
              );
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
class CourseDetailScreen extends StatelessWidget {
  final Map<String, String> course;

  CourseDetailScreen({required this.course});

  String getCourseDetails(String title) {
    switch (title) {
      case 'Landscape Photography':
        return 'This course will teach you the art of capturing stunning landscapes. Explore techniques for lighting, composition, and showcasing natural beauty.Landscape photography is the art of capturing pictures of nature and the outdoors in a way that brings your viewer into the scene. From grand landscapes to intimate details, the best photos demonstrate the photographers own connection to nature and capture the essence of the world around them.';
      case 'Wedding Photography':
        return 'Learn how to capture beautiful and memorable wedding moments. This course covers posing, lighting, and storytelling for wedding photography.This style of photography blends portraiture, candid shots, and event photography to tell a complete story of the day. Wedding photographers often use natural light, scenic backdrops, and intricate compositions to enhance the beauty of each frame. Special attention is given to details like wedding attire, décor, and meaningful gestures, ensuring every element is immortalized.';
      case 'Wildlife Photography':
        return 'Dive into the wild and learn how to capture animals in their natural habitat. This course focuses on patience, timing, and equipment tips.This type of photography emphasizes respect for animals and their ecosystems, often raising awareness about conservation efforts. Wildlife photography combines technical skill, creative vision, and a passion for the natural world to produce images that inspire awe, wonder, and a deeper connection to the planets incredible biodiversity.';
      case 'Travel Photography':
        return 'Discover the secrets to capturing your travel experiences beautifully. Learn to document culture, architecture, and landscapes on the go.This type of photography often requires adaptability, creativity, and a keen eye for detail. From shooting in diverse lighting conditions to interacting respectfully with local communities, travel photographers immerse themselves in their surroundings to authentically capture the spirit of their journey. The resulting images inspire exploration and foster a deeper appreciation for the worlds cultural and geographic diversity.';
      default:
        return 'Enhance your photography skills with this course. Learn tips and techniques from professionals to take your photography to the next level.';
    }
  }

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
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('4.6', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8),
                  Text('10.5k Learners', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(course['description']!),
              SizedBox(height: 16),
              Text(
                'What will I learn?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(getCourseDetails(course['title']!)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Action for starting the course
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



class MyCoursesScreen extends StatelessWidget {
  final List<Map<String, String>> myCourses;

  MyCoursesScreen({required this.myCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: myCourses.isEmpty
          ? Center(child: Text('No courses added to My Courses'))
          : ListView.builder(
        itemCount: myCourses.length,
        itemBuilder: (context, index) {
          final course = myCourses[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 8.0,
            child: Container(
              height: 200,
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(course: course),
                    ),
                  );
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        course['imageUrl']!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            course['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            course['description']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:

              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    'D',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'David Todorovski',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'davidtodorovski@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Refer and Learn'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.link, color: Colors.blue),
            title: Text('Connected Accounts'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.blue),
            title: Text('Rate App'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.blue),
            title: Text('Share App'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.blue),
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.blue),
            title: Text('Sign out'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCoursesScreen(myCourses: []),
                ),
              );
              break;
            case 2:

              break;
          }
        },
      ),
    );
  }
}


