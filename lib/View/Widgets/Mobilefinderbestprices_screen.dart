import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class MobilefinderBestPriceScreen extends StatefulWidget {
  const MobilefinderBestPriceScreen({super.key});

  @override
  State<MobilefinderBestPriceScreen> createState() =>
      _MobilefinderBestPriceScreenState();
}

class _MobilefinderBestPriceScreenState
    extends State<MobilefinderBestPriceScreen> {
  final List<Map<String, dynamic>> _items = [
    {'subtitle': 'Rs 5000/-'},
    {'subtitle': 'Rs 8000/-'},
    {'subtitle': 'Rs 10000/-'},
    {'subtitle': 'Rs 12000/-'},
    {'subtitle': 'Rs 15000/-'},
    {'subtitle': 'Rs 20000/-'},
    {'subtitle': 'Rs 25000/-'},
    {'subtitle': 'Rs 30000/-'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _items.map((item) {
          return GestureDetector(
            onTap: () {
              // Handle onTap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item['title']} tapped'),
                ),
              );
            },
            child: Card(
              elevation: 5,
              color: Colors.black.withOpacity(0.5),
              margin: const EdgeInsets.all(8.0), // Adjust margin for spacing
              child: Container(
                width: 180,
                height: 150,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone_iphone,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Best Phone",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Poppins",
                          color: AppColors.hippieBlue,
                        )),
                    Text(item['subtitle'],
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Poppins",
                          color: AppColors.paleSlate,
                        )),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
