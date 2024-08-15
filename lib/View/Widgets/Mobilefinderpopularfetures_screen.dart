import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class MobilefinderPopularFeaturesContainers extends StatefulWidget {
  @override
  State<MobilefinderPopularFeaturesContainers> createState() =>
      _MobilefinderPopularFeaturesContainersState();
}

class _MobilefinderPopularFeaturesContainersState
    extends State<MobilefinderPopularFeaturesContainers> {
  // List of data for the items
  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.android,
      'title': 'Android Phones around',
      'subtitle': 'Rs 10,000'
    },
    {
      'icon': Icons.screenshot_monitor_rounded,
      'title': 'Large Screen',
      'subtitle': 'Smartphones'
    },
    {'icon': Icons.memory, 'title': '6GB &', 'subtitle': 'Above RAM'},
    {
      'icon': Icons.fingerprint,
      'title': 'In-display',
      'subtitle': 'Fingetprint Sensor'
    },
    {
      'icon': Icons.battery_charging_full,
      'title': 'Wireless',
      'subtitle': 'Charging'
    },
    {
      'icon': Icons.lte_mobiledata,
      'title': '4G VoLTE',
      'subtitle': 'Voice over LTE'
    },
    {'icon': Icons.network_cell, 'title': '5G', 'subtitle': 'Phones'},
    {
      'icon': Icons.phone_iphone_rounded,
      'title': 'AMOLED',
      'subtitle': 'Display'
    },
    {
      'icon': Icons.battery_5_bar,
      'title': '5000mAh & Above',
      'subtitle': 'Battery Capacity'
    },
    {'icon': Icons.sim_card_sharp, 'title': 'Dual Sim', 'subtitle': ''},
    {
      'icon': Icons.camera_alt_outlined,
      'title': '64 MP & Above',
      'subtitle': 'Camera'
    },
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
                    Icon(
                      item['icon'],
                      size: 28.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    Text(item['title'],
                        style: const TextStyle(
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
