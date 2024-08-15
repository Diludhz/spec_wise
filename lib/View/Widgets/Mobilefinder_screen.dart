import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';
import 'package:specspot/Utils/Mobilearoundunder10k.dart';
import 'package:specspot/Utils/Mobilearoundunder15k.dart';
import 'package:specspot/Utils/Mobilearoundunder20k.dart';
import 'package:specspot/Utils/Mobilearoundunder25k.dart';
import 'package:specspot/Utils/Mobilearoundunder5k.dart';
import 'package:specspot/Utils/Mobilearoundunder8k.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/Utils/Title_headings.dart';
import 'package:specspot/View/Widgets/Brandlistview.dart';
import 'package:specspot/View/Widgets/Mobilefinderbestprices_screen.dart';
import 'package:specspot/View/Widgets/Mobilefindermostpopular_screen.dart';
import 'package:specspot/View/Widgets/Mobilefinderpopularfetures_screen.dart';
import 'package:specspot/View/Widgets/PriceAroundContainer.dart';

import 'package:specspot/View/Widgets/UpcomingMobiles.dart';

class MobileFinderScreen extends StatefulWidget {
  @override
  _MobileFinderScreenState createState() => _MobileFinderScreenState();
}

class _MobileFinderScreenState extends State<MobileFinderScreen> {
  RangeValues _currentRangeValues = const RangeValues(0, 65000);
  late TextEditingController _startController;
  late TextEditingController _endController;

  @override
  void initState() {
    super.initState();
    _startController = TextEditingController(
        text: _currentRangeValues.start.toInt().toString());
    _endController =
        TextEditingController(text: _currentRangeValues.end.toInt().toString());
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  void _updateRangeValues(RangeValues values) {
    setState(() {
      _currentRangeValues = values;
      _startController.text = values.start.toInt().toString();
      _endController.text = values.end.toInt().toString();
    });
  }

  void _onStartChanged(String value) {
    final startValue =
        int.tryParse(value)?.toDouble() ?? _currentRangeValues.start;
    _updateRangeValues(RangeValues(startValue, _currentRangeValues.end));
  }

  void _onEndChanged(String value) {
    final endValue = int.tryParse(value)?.toDouble() ?? _currentRangeValues.end;
    _updateRangeValues(RangeValues(_currentRangeValues.start, endValue));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const textFieldHeight = 40.0; // Set a fixed height for the TextField
    final cardWidth =
        screenWidth * 0.28; // Adjust card width based on screen width

    return Scaffold(
      body: Container(
        decoration: Styles.gradientDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Mobile Finder",
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Rs.',
                      style: TextStyle(
                          fontFamily: 'Poppins', color: AppColors.paleSlate),
                    ),
                    SizedBox(
                      width: screenWidth * 0.25,
                      height: textFieldHeight,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center, // Center-align text
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: _onStartChanged,
                        controller: _startController,
                      ),
                    ),
                    const Text(
                      'to',
                      style:
                          TextStyle(fontFamily: "Poppins", color: Colors.white),
                    ),
                    const Text(
                      'Rs.',
                      style:
                          TextStyle(fontFamily: "Poppins", color: Colors.white),
                    ),
                    SizedBox(
                      width: screenWidth * 0.25,
                      height: textFieldHeight,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center, // Center-align text
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: _onEndChanged,
                        controller: _endController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                RangeSlider(
                  activeColor: Colors.orange,
                  values: _currentRangeValues,
                  min: 0,
                  max: 65000,
                  divisions: 650,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    _updateRangeValues(values);
                  },
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      // Handle the mobile search functionality
                    },
                    child: const Text(
                      'Find Mobiles',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Price Around',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: "Poppins")),
                  ),
                ),
                const SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PriceCard(
                        price: 5000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder5kScreen()));
                        },
                      ),
                      PriceCard(
                        price: 8000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder8kScreen()));
                        },
                      ),
                      PriceCard(
                        price: 10000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder10kScreen()));
                        },
                      ),
                      PriceCard(
                        price: 15000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder15kScreen()));
                        },
                      ),
                      PriceCard(
                        price: 20000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder20kScreen()));
                        },
                      ),
                      PriceCard(
                        price: 25000,
                        cardWidth: cardWidth,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilefinderUnder25kScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                const HeadingRow(
                    text1: "Mobiles by Popular Brands", text2: "See all"),
                BrandHorizontalListView(),
                const HeadingRow(
                    text1: "Mobiles by Popular Features", text2: "See all"),
                MobilefinderPopularFeaturesContainers(),
                const HeadingRow(text1: "Best Phones by Price", text2: ""),
                const MobilefinderBestPriceScreen(),
                const HeadingRow(text1: "Most Popular Mobiles", text2: ""),
                MobilefinderMostPopularScreen(),
                const HeadingRow(text1: "Upcoming & Recent Mobiles", text2: ""),
                HorizontalUpcomingMobileList(),
                const HeadingRow(text1: "Head Line News", text2: ""),
                //  const NewsScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
