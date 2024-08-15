import 'package:flutter/material.dart';

class HeadingRow extends StatelessWidget {
  final VoidCallback? onButtonPressed; // Make this nullable
  final String text1;
  final String text2;
  final bool isButtonEnabled; // Add this property

  const HeadingRow({
    super.key,
    this.onButtonPressed, // Make this nullable
    required this.text1,
    required this.text2,
    this.isButtonEnabled =
        true, // Default to true if you want the button to be enabled by default
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: isButtonEnabled
                ? onButtonPressed
                : null, // Disable button if not enabled
            child: Text(
              text2,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: isButtonEnabled
                    ? Colors.white
                    : Colors.grey, // Change color when disabled
              ),
            ),
          ),
        ],
      ),
    );
  }
}
