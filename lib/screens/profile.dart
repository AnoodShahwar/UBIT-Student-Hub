import 'package:flutter/material.dart';
import 'package:ubit_student_hub/screens/marketplace.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final _profileFormKey = GlobalKey<FormState>();
  String _selectedGender = 'Female';
  String? _selectedDepartment;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 20, color: Color(0xFF051D6D)),
        title: Text(
          'UBIT Hub',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFF051D6D),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              radius: 16,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT ACCOUNT',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF051D6D),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Alex Harrison',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Computer Science & Engineering · Class of 2025',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, size: 14, color: Color(0xFF051D6D)),
                      SizedBox(width: 4),
                      Text(
                        'Verified Student',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF051D6D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                TabBar(
                  controller: _tabController,
                  indicatorColor: Color(0xFF051D6D),
                  labelColor: Color(0xFF051D6D),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Personal Info'),
                    Tab(text: 'My Listings'),
                    Tab(text: 'Stats'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _profileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.badge_outlined,
                                    color: Color(0xFF051D6D),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Profile Identity',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Full Name',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              TextFormField(
                                initialValue: 'Alex Harrison',
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Student ID',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              TextFormField(
                                initialValue: 'UB-9283471',
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Department Selection',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              DropdownButtonFormField<String>(
                                value: _selectedDepartment,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                items:
                                    [
                                          'Computer Science & Engineering',
                                          'Electrical Engineering',
                                          'Business Administration',
                                          'Social Sciences',
                                        ]
                                        .map(
                                          (dept) => DropdownMenuItem(
                                            value: dept,
                                            child: Text(dept),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) =>
                                    setState(() => _selectedDepartment = value),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Gender Identification',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              RadioListTile<String>(
                                title: Text('Male'),
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value) =>
                                    setState(() => _selectedGender = value!),
                                activeColor: Color(0xFF051D6D),
                              ),
                              RadioListTile<String>(
                                title: Text('Female'),
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) =>
                                    setState(() => _selectedGender = value!),
                                activeColor: Color(0xFF051D6D),
                              ),
                              RadioListTile<String>(
                                title: Text('Non-binary'),
                                value: 'Non-binary',
                                groupValue: _selectedGender,
                                onChanged: (value) =>
                                    setState(() => _selectedGender = value!),
                                activeColor: Color(0xFF051D6D),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Color(0xFF051D6D)),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF051D6D),
                                ),
                                child: Text(
                                  'Save Changes',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFF051D6D),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Profile Strength',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '85%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: 0.85,
                                backgroundColor: Colors.white24,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Complete your profile to unlock premium marketplace features and campus discounts.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Privacy Note',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Your department information helps us tailor marketplace recommendations and campus alerts.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Color(0xFF051D6D),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MarketplaceScreen()),
            );
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
