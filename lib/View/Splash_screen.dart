import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/View/Login_screen.dart';
import 'package:specspot/View/Register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: SplashTextWidget(size: size),
              ),
            ),
            const Spacer(), // Push buttons to the bottom
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, // Responsive padding
                vertical: size.height * 0.03,
              ),
              child: Column(children: [
                _buildButton(context,
                    label: "Login",
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.transparent, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen()), // Replace LoginPage with your actual login page widget
                  );
                }),
                SizedBox(height: size.height * 0.02), // Space between buttons
                _buildButton(context,
                    label: "Register",
                    color: const Color(0xFF1E232C),
                    textColor: Colors.white,
                    borderColor: Colors.transparent, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegisterScreen()), // Replace LoginPage with your actual login page widget
                  );
                }),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required Color color,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    final double buttonWidth =
        MediaQuery.of(context).size.width * 0.8; // Responsive width

    return SizedBox(
      width: buttonWidth, // Responsive width
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.04), // Responsive padding
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Poppins',
              fontSize: MediaQuery.of(context).size.width *
                  0.04, // Responsive font size
            ),
          ),
        ),
      ),
    );
  }
}

class SplashTextWidget extends StatefulWidget {
  final Size size;

  const SplashTextWidget({
    super.key,
    required this.size,
  });

  @override
  _SplashTextWidgetState createState() => _SplashTextWidgetState();
}

class _SplashTextWidgetState extends State<SplashTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _bounceAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double titleFontSize = widget.size.width * 0.35;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _bounceAnimation,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Spec',
                style: TextStyle(
                  color: AppColors.paleSlate,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: titleFontSize,
                ),
              ),
              TextSpan(
                text: 'Wise',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: titleFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
