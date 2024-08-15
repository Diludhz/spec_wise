import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:specspot/Services/SendmailOtp_page.dart';
import 'package:specspot/Utils/Colors.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/View/Createnewpassword_screen.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  final String otp;

  const OTPScreen({super.key, required this.email, required this.otp});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  String _currentOtp;
  bool _isOtpValid = true;

  _OTPScreenState() : _currentOtp = '';

  @override
  void initState() {
    super.initState();
    _currentOtp = widget.otp;
  }

  Future<void> _verifyOtp() async {
    final otp = _otpController.text;
    setState(() {
      _isLoading = true;
    });

    if (otp == _currentOtp) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreatePasswordScreen(),
        ),
      );
    } else {
      setState(() {
        _isOtpValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to verify OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _resendOtp() async {
    setState(() {
      _isLoading = true;
    });

    // Generate a new OTP
    final newOtp = (Random().nextInt(9000) + 1000).toString();
    print('New OTP: $newOtp'); // Print the new OTP for testing purposes

    // Send the new OTP email
    await sendOtpEmail(widget.email, newOtp);

    setState(() {
      _isLoading = false;
      _currentOtp = newOtp;
      _isOtpValid = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('A new OTP has been sent to your email.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final double horizontalPadding = screenWidth * 0.05;
    final double verticalSpacing = screenHeight * 0.02;
    final double pinSize = screenWidth * 0.18; // Dynamic size for PIN input
    final double fontSizeTitle = screenWidth * 0.075;
    final double fontSizeText = screenWidth * 0.04;

    PinTheme defaultTheme = PinTheme(
      height: pinSize,
      width: pinSize,
      textStyle: TextStyle(fontSize: fontSizeText),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    PinTheme focusedTheme = PinTheme(
      height: pinSize,
      width: pinSize,
      textStyle: TextStyle(fontSize: fontSizeText),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
    PinTheme errorTheme = PinTheme(
      height: pinSize,
      width: pinSize,
      textStyle: TextStyle(fontSize: fontSizeText),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: Styles.gradientDecoration,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: verticalSpacing * 1),
                FaIcon(
                  FontAwesomeIcons.passport,
                  color: Colors.white,
                  size: screenWidth * 0.6,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 14, bottom: 14),
                  child: SizedBox(
                    width: screenWidth * 0.8,
                    child: Text(
                      "OTP Verification",
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
                    "Enter the verification code we just sent to your email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.paleSlate,
                        fontSize: fontSizeText,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Pinput(
                    controller: _otpController,
                    defaultPinTheme: defaultTheme,
                    focusedPinTheme: focusedTheme,
                    submittedPinTheme: _isOtpValid ? focusedTheme : errorTheme,
                    onChanged: (value) {
                      setState(() {
                        _isOtpValid = true;
                      });
                    },
                  ),
                ),
                SizedBox(height: verticalSpacing * 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: SizedBox(
                    width:
                        screenWidth * 0.9, // Increase the width of the button
                    child: MaterialButton(
                      color: const Color(0xFF1E232C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: _isLoading ? null : _verifyOtp,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                "Verify",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeText,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing * 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive code? ",
                      style: TextStyle(
                        fontSize: fontSizeText,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: _resendOtp,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: const Color(0xFF35C2C1),
                          fontSize: fontSizeText,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
