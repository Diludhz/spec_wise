import 'package:flutter/material.dart';

class MobilefinderMostPopularScreen extends StatefulWidget {
  @override
  State<MobilefinderMostPopularScreen> createState() =>
      _MobilefinderMostPopularScreenState();
}

class _MobilefinderMostPopularScreenState
    extends State<MobilefinderMostPopularScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Set a fixed height for the list
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MobileCard(
            imageUrl: 'assets/icons/upcomingdemo.jpeg',
            title: 'vivo V40 Pro',
            specScore: '95%',
            price: '49,999',
          ),
          MobileCard(
            imageUrl: 'assets/icons/upcomingdemo.jpeg',
            title: 'iQOO Z9 Turbo',
            specScore: '93%',
            price: '59,999',
          ),
          MobileCard(
            imageUrl: 'assets/icons/upcomingdemo.jpeg',
            title: 'Goc',
            specScore: '78%',
            price: '23,999',
          ),
        ],
      ),
    );
  }
}

class MobileCard extends StatelessWidget {
  final String imageUrl;
  final String specScore;
  final String title;
  final String price;

  MobileCard({
    required this.imageUrl,
    required this.specScore,
    required this.title,
    required this.price,
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
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      specScore,
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
