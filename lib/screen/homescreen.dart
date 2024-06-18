import 'package:mini_campus_connect/screen/signin_screen.dart';
import 'package:flutter/material.dart';
import '../utils/color_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example list of posts and blogs
  List<Map<String, dynamic>> items = [
    {
      'type': 'post',
      'title': "Post 1",
      'content': "Post content here",
      'image': "https://via.placeholder.com/400x200",
    },
    {
      'type': 'post',
      'title': "Post 2",
      'content': "Post content here",
      'image': "https://via.placeholder.com/400x200",
    },
    {
      'type': 'blog',
      'title': "Blog 1",
      'content': "Blog content here",
    },
    {
      'type': 'post',
      'title': "Post 3",
      'content': "Post content here",
      'image': "https://via.placeholder.com/400x200",
    },
    {
      'type': 'blog',
      'title': "Blog 2",
      'content': "Blog content here",
    },
  ];

  void handleAIDialog() {
    // Replace with logic to show AI talk dialog or perform action
    print("AI talk activated");
  }

  List<Map<String, dynamic>> get posts {
    return items.where((item) => item['type'] == 'post').toList();
  }

  List<Map<String, dynamic>> get blogs {
    return items.where((item) => item['type'] == 'blog').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.person_outline),
          color: Colors.black,
          onPressed: () {
            // Handle camera button press
          },
        ),
        title: Text(
          "Campus Connect",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong', // Example custom font
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              print("Signed Out");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (items[index]['type'] == 'post') {
              // Display post with image
              return buildPostWidget(posts.indexOf(items[index]));
            } else if (items[index]['type'] == 'blog') {
              // Display blog with text
              return buildBlogWidget(blogs.indexOf(items[index]));
            }
            return SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: handleAIDialog,
          child: Transform.scale(
            scale: 1.1,
            child: FloatingActionButton(
              onPressed: handleAIDialog,
              tooltip: 'AI Talk',
              child: Image.asset(
                "assets/images/ai.gif", // Replace with your AI talk animated GIF path
                height: 48, // Adjust size as needed
                width: 48,
              ),
              backgroundColor: Colors.black,
              elevation: 2,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: 'Anonymous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_sharp),
            activeIcon: Icon(Icons.macro_off_sharp),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
            // Navigate to home
              break;
            case 1:
            // Filter to show only blogs
              setState(() {
                items = items.where((item) => item['type'] == 'blog').toList();
              });
              break;
            case 2:
            // Filter to show only posts
              setState(() {
                items = items.where((item) => item['type'] == 'post').toList();
              });
              break;
            case 3:
            // Navigate to messages or handle as needed
              break;
            case 4:
            // Navigate to search or handle as needed
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Widget buildPostWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Anonymous", // Replace with your logic for username
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle more options button press
                    },
                  ),
                ],
              ),
            ),
            Image.network(
              posts[index]['image'], // Example image URL
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    posts[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    posts[index]['content'],
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Handle like button press
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: () {
                          // Handle comment button press
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Handle share button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlogWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Anonymous", // Replace with your logic for username
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle more options button press
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    blogs[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    blogs[index]['content'],
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Handle like button press
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: () {
                          // Handle comment button press
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Handle share button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
