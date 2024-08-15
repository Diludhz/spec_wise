import 'package:flutter/material.dart';
import 'package:specspot/View/Widgets/Mobilefinder_screen.dart';

class HomeGridViewScreen extends StatefulWidget {
  @override
  State<HomeGridViewScreen> createState() => _HomeGridViewScreenState();
}

class _HomeGridViewScreenState extends State<HomeGridViewScreen> {
  bool _showAll = false;

  // List of all items
  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.phone_android,
      'label': 'MOBILES',
      'page': MobileFinderScreen()
    },
    {'icon': Icons.tablet, 'label': 'TABLETS', 'page': LaptopsPage()},
    {'icon': Icons.laptop, 'label': 'LAPTOPS', 'page': LaptopsPage()},
    {
      'icon': Icons.headset,
      'label': 'HEADPHONES\nEARPHONES',
      'page': LaptopsPage()
    },
    {
      'icon': Icons.watch,
      'label': 'SMARTWATCHES\n& FITNESS BANDS',
      'page': LaptopsPage()
    },
    {'icon': Icons.tv, 'label': 'TELEVISIONS', 'page': LaptopsPage()},
    {'icon': Icons.ac_unit, 'label': 'AIR CONDITIONERS', 'page': LaptopsPage()},
    {'icon': Icons.kitchen, 'label': 'REFRIGERATORS', 'page': LaptopsPage()},
    {
      'icon': Icons.local_laundry_service,
      'label': 'WASHING MACHINE',
      'page': LaptopsPage()
    },
    {'icon': Icons.camera_alt, 'label': 'CAMERA', 'page': LaptopsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    // Determine how many items to show
    final int itemsToShow = _showAll ? _items.length : 6;

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300), // Smooth transition
            height: _showAll ? 400 : 260, // Adjust the height dynamically
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsToShow,
              itemBuilder: (context, index) {
                final item = _items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item['page'],
                      ),
                    );
                  },
                  child: _buildCategoryItem(item['icon'], item['label']),
                );
              },
            ),
          ),
          SizedBox(height: 10), // Spacing between GridView and button
          TextButton(
            onPressed: () {
              setState(() {
                _showAll =
                    !_showAll; // Toggle between showing all and showing a subset
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: Center(
              child: Text(
                _showAll ? 'VIEW LESS' : 'VIEW MORE',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData iconData, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 50,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class LaptopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptops'),
      ),
      body: Center(
        child: Text(
          'Welcome to Laptops Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
