import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:specspot/Utils/Colors.dart';
import 'package:specspot/Utils/Styles.dart';
import 'package:specspot/View/Login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: Styles.gradientDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  FaIcon(
                    FontAwesomeIcons.mailchimp,
                    color: Colors.white,
                    size: screenWidth * 0.4,
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello!\n",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Register to get started',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: AppColors.paleSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    'Username (optional)',
                    (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildEmailField(),
                  const SizedBox(height: 15),
                  _buildPasswordField(),
                  const SizedBox(height: 15),
                  _buildConfirmPasswordField(),
                  const SizedBox(height: 20),
                  _buildRegisterButton(screenWidth),
                  const SizedBox(height: 20),
                  _buildDividerText(context, "Or Register With"),
                  const SizedBox(height: 15),
                  _buildSocialButtons(),
                  const SizedBox(height: 20),
                  const Spacer(),
                  _buildLoginRedirect(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, Function(String) onChanged) {
    return Container(
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
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    bool isEmailValid = _email.contains('@gmail.com');
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: isEmailValid ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@gmail.com')) {
              return 'Email must be a Gmail address';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    bool isPasswordValid = _password.length >= 6;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: isPasswordValid ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    bool isConfirmPasswordValid = _password == _confirmPassword;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: isConfirmPasswordValid ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Confirm password',
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          onChanged: (value) {
            setState(() {
              _confirmPassword = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != _password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildRegisterButton(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.9,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E232C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: _handleRegister,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Color(0xFFE8ECF4),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color(0xFFE8ECF4),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE8ECF4),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/fb.png",
                  height: 32,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE8ECF4),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/google.png",
                  height: 32,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE8ECF4),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/apple.png",
                  height: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginRedirect(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account? ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(showSnackbar: true),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: Color(0xFF35C2C1),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _username);
      await prefs.setString('email', _email);
      await prefs.setString('password', _password);

      _showSnackbar('You have been registered into our family.');

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });

      setState(() {
        _username = '';
        _email = '';
        _password = '';
        _confirmPassword = '';
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
