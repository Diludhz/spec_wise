import 'package:flutter/material.dart';
import 'package:specspot/Utils/AnimatedIcons.dart';
import 'package:specspot/Utils/SearchTextformfeild.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/Utils/Title_headings.dart';
import 'package:specspot/View/Widgets/BrandListview.dart';
import 'package:specspot/View/Widgets/Homegridview.dart';
import 'package:specspot/View/Widgets/Recentlyviewed.dart';
import 'package:specspot/View/Widgets/UpcomingMobiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: Styles.gradientDecoration,
        child: Column(
          children: [
            // Fixed elements: AnimatedIconButtonRow and SearchFormField
            const AnimatedIconButtonRow(),
            const SearchFormField(),
            const SizedBox(height: 10),

            // Scrollable content starts here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeadingRow(
                      text1: "What are you looking to buy?",
                      text2: "",
                    ),
                    HomeGridViewScreen(),
                    const SizedBox(
                        height: 20), // Added spacing for layout clarity
                    const HeadingRow(
                      text1: "Featured Mobile Brands",
                      text2: "See all",
                    ),
                    BrandHorizontalListView(), // Make sure this listview has a defined height
                    const SizedBox(
                        height: 20), // Added spacing for layout clarity
                    const HeadingRow(
                      text1: "Upcoming Mobiles",
                      text2: "See all",
                    ),
                    HorizontalUpcomingMobileList(),
                    const HeadingRow(
                      text1: "Recently Viewed & Recommended",
                      text2: "",
                    ),
                    RecentlyviewedRecommenedList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
