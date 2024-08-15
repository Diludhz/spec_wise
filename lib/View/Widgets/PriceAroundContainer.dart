import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class PriceCard extends StatelessWidget {
  final int price;
  final double cardWidth;
  final VoidCallback onTap; // Add this callback for tap handling

  const PriceCard({
    Key? key,
    required this.price,
    required this.cardWidth,
    required this.onTap, // Make onTap required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap, // Trigger the onTap callback when the card is tapped
        child: Container(
          height: 100,
          width: cardWidth,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              const Text(
                'MOBILES',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.hippieBlue,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'AROUND',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.hippieBlue,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                '₹ $price',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
