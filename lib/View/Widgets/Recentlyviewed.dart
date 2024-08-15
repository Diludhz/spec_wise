import 'package:flutter/material.dart';

class RecentlyviewedRecommenedList extends StatefulWidget {
  @override
  State<RecentlyviewedRecommenedList> createState() =>
      _RecentlyviewedRecommenedListState();
}

class _RecentlyviewedRecommenedListState
    extends State<RecentlyviewedRecommenedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Set a fixed height for the list
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PhoneCard(
            imageUrl: 'assets/icons/recentlydemo.jpeg',
            title: 'vivo V40 Pro',
            specScore: '95%',
            price: '49,999',
          ),
          PhoneCard(
            imageUrl: 'assets/icons/recentlydemo.jpeg',
            title: 'iQOO Z9 Turbo',
            specScore: '93%',
            price: '59,999',
          ),
          PhoneCard(
            imageUrl: 'assets/icons/recentlydemo.jpeg',
            title: 'Goc',
            specScore: '78%',
            price: '23,999',
          ),
        ],
      ),
    );
  }
}

class PhoneCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? specScore;
  final String? price;

  PhoneCard({
    required this.imageUrl,
    required this.title,
    this.specScore,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                if (specScore != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        specScore!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ),
            if (price != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '₹ $price',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
