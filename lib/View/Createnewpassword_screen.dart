import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:specspot/Utils/Colors.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/View/Changedpassword_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool get _isPasswordsMatch =>
      _passwordController.text == _confirmPasswordController.text;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final double horizontalPadding = screenWidth * 0.05;
    final double verticalSpacing = screenHeight * 0.02;
    final double fontSizeTitle = screenWidth * 0.075;
    final double fontSizeText = screenWidth * 0.04;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          // padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: Styles.gradientDecoration,
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Ensure the column takes only as much height as needed
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: verticalSpacing),
              FaIcon(
                FontAwesomeIcons.passport,
                color: Colors.white,
                size: screenWidth * 0.6,
              ),
              SizedBox(height: verticalSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: Text(
                    "Create new password",
                    style: TextStyle(
                      fontSize: fontSizeTitle,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalSpacing),
                child: Text(
                  "Your new password must be unique from those previously used.",
                  style: TextStyle(
                      color: AppColors.paleSlate,
                      fontSize: fontSizeText,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(height: verticalSpacing),
              // Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F9),
                    border: Border.all(
                      color: const Color(0xFFE8ECF4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                            color: Colors.black, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: verticalSpacing),
              // Confirm Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F9),
                    border: Border.all(
                      color: const Color(0xFFE8ECF4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm password',
                        hintStyle: TextStyle(
                            color: Colors.black, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: verticalSpacing * 2),
              // Register Button
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalSpacing),
                child: SizedBox(
                  width: screenWidth * 0.9, // Increase the width of the button
                  child: MaterialButton(
                    color: const Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      if (_isPasswordsMatch) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PasswordCreatedScreen()),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeText,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: verticalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
