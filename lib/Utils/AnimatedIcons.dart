import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class AnimatedIconButtonRow extends StatefulWidget {
  const AnimatedIconButtonRow({super.key});

  @override
  _AnimatedIconButtonRowState createState() => _AnimatedIconButtonRowState();
}

class _AnimatedIconButtonRowState extends State<AnimatedIconButtonRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Trigger the fade-in effect after a slight delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.paleSlate),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                iconSize: 20.0,
                onPressed: () {
                  // Handle button press
                },
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: RichText(
              text: const TextSpan(
                text: 'Spec',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Spot',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: AppColors.paleSlate,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ScaleTransition(
            scale: _animation,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.paleSlate),
              ),
              child: IconButton(
                icon: const Icon(Icons.notification_important),
                color: Colors.white,
                iconSize: 20.0,
                onPressed: () {
                  // Handle button press
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
