import 'package:flutter/material.dart';
import 'package:ubit_student_hub/screens/login.dart';
import 'package:ubit_student_hub/screens/marketplace.dart';
import 'package:ubit_student_hub/screens/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, size: 20, color: Color(0xFF051D6D)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'UBIT Hub',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFF051D6D),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0xFF051D6D),
              child: Text(
                'AH',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF051D6D)),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Color(0xFF051D6D)),
              title: Text('About'),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 241, 206, 211),
                          radius: 30,
                          child: Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Sign out?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Are you sure you want to end your session? You\'ll need to sign back in to access your student portal.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 49, 49, 49),
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'No, stay',
                                  style: TextStyle(color: Color(0xFF051D6D)),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF051D6D),
                                ),
                                child: Text(
                                  'Yes, sign out',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Alex Harrison',
                style: TextStyle(
                  fontSize: 27,
                  color: Color(0xFF051D6D),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Your academic architect dashboard is ready.',
                style: TextStyle(fontSize: 15, color: Color(0xFF302F2F)),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CURRENT GPA',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '3.82',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF051D6D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Color(0xFF051D6D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NEXT CLASS',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'CS 401',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10:30 AM • Hall B',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Campus News',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF051D6D),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              FeaturedNewsCard(),
              SizedBox(height: 16),
              NewsListItem(
                image: 'assets/meeting.jpg',
                title: 'Registration for Fall...',
                subtitle: 'Check your enrollment window in the portal.',
              ),
              NewsListItem(
                image: 'assets/career.jpg',
                title: 'Annual Career Fair: 5...',
                subtitle: 'Prepare your digital portfolio for next Tuesday.',
              ),
              NewsListItem(
                image: 'assets/laptop.jpeg',
                title: 'AI & Ethics Worksho...',
                subtitle:
                    'Join the philosophy and tech departments this Friday.',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF051D6D),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF051D6D),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MarketplaceScreen()),
            ).then((_) {
              setState(() {
                _currentIndex = 0;
              });
            });
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            ).then((_) {
              setState(() {
                _currentIndex = 0;
              });
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FeaturedNewsCard extends StatelessWidget {
  const FeaturedNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/eng_building.jpg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF051D6D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'FEATURED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 215, 236),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'ACADEMIC',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'New Research Grant Awarded to Engineering Faculty',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 4),
                Text(
                  'The \$2.4M grant will fund sustainable energy initiatives across the campus for t...',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsListItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const NewsListItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, width: 56, height: 56, fit: BoxFit.cover),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w900)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Color.fromARGB(255, 92, 91, 91)),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}
