import 'package:flutter/material.dart';
import 'package:ubit_student_hub/screens/profile.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final String condition;
  final String image;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.condition,
    required this.image,
  });
}

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});
  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String _selectedChip = 'All Items';
  final List<Product> products = [
    Product(
      name: 'Fundamentals of Algorithms',
      category: 'Computer Science Dept.',
      price: 45.00,
      condition: 'LIKE NEW',
      image: 'assets/algo.jpg',
    ),
    Product(
      name: 'MacBook Pro 14"',
      category: 'Tech & Gadgets',
      price: 850.00,
      condition: '2022 MODEL',
      image: 'assets/macbook.jpeg',
    ),
    Product(
      name: 'Modern Sociology Vol. 1',
      category: 'Social Sciences',
      price: 25.00,
      condition: 'ANNOTATED',
      image: 'assets/pile.jpg',
    ),
    Product(
      name: 'Mechanical Keyboard',
      category: 'Accessories',
      price: 65.00,
      condition: 'WIRELESS',
      image: 'assets/keyboard.jpg',
    ),
    Product(
      name: 'Smartwatch Series 6',
      category: 'Wearables',
      price: 120.00,
      condition: 'UNBOXED',
      image: 'assets/watch.jpeg',
    ),
    Product(
      name: 'Graphing Calculator',
      category: 'Math',
      price: 15.00,
      condition: 'ESSENTIAL',
      image: 'assets/calc.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 20,
          color: Color.fromARGB(255, 0, 0, 0),
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
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 229, 229),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.search, size: 20, color: Color(0xFF051D6D)),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 229, 229),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                size: 20,
                color: Color(0xFF051D6D),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CAMPUS ECONOMY',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF051D6D),
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Marketplace',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 222, 228, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '428 Items',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _selectedChip = 'All Items'),
                    child: FilterChip(
                      label: 'All Items',
                      isSelected: _selectedChip == 'All Items',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _selectedChip = 'Textbooks'),
                    child: FilterChip(
                      label: 'Textbooks',
                      isSelected: _selectedChip == 'Textbooks',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _selectedChip = 'Laptops'),
                    child: FilterChip(
                      label: 'Laptops',
                      isSelected: _selectedChip == 'Laptops',
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => _selectedChip = 'Accessories'),
                    child: FilterChip(
                      label: 'Accessories',
                      isSelected: _selectedChip == 'Accessories',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Color(0xFF051D6D),
        icon: Icon(Icons.add, color: Colors.white),
        label: Text(
          'Sell Item',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Color(0xFF051D6D),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
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

class FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChip({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF051D6D) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF051D6D),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    product.condition,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF051D6D),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  product.category,
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
