import 'package:flutter/material.dart';

class BrandHorizontalListView extends StatefulWidget {
  @override
  State<BrandHorizontalListView> createState() =>
      _BrandHorizontalListViewState();
}

class _BrandHorizontalListViewState extends State<BrandHorizontalListView> {
  final List<String> _brandIcons = [
    'assets/icons/oneplus.png',
    'assets/icons/samsung.png',
    'assets/icons/oneplus.png',
    'assets/icons/samsung.png',
    'assets/icons/oneplus.png',
  ];

  void _onBrandTap(String brand) {
    // Navigate to the brand-specific page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrandDetailPage(brand: brand),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70.0, // Adjust height based on icon size
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _brandIcons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () => _onBrandTap(_brandIcons[index]), // Handle tap
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.5),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    _brandIcons[index],
                    height: 50.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BrandDetailPage extends StatelessWidget {
  final String brand;

  const BrandDetailPage({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand Details'),
      ),
      body: Center(
        child: Text(
          'Details for $brand',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
