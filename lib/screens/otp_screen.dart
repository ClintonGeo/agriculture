import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Import the pinput package

import 'login_succes_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Request focus for the Pinput field when the screen loads.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopGraphicSection(context),
            _buildBottomFormSection(context),
          ],
        ),
      ),
    );
  }

  /// This widget builds the top graphic section.
 
  Widget _buildTopGraphicSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    const Color primaryGreen = Color(0xff0b2813);
    const Color textGreen = Color(0xff3DBB5B);

    return Container(
      height: screenHeight * 0.65,
      width: double.infinity,
      color: primaryGreen,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Shade Image
          Positioned(
            right: screenWidth * 0.05,
            left: 0.0,
            child: Image.asset('assets/images/888.png', fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
          // AMSHA Logo Image
          Positioned(
            top: statusBarHeight + (screenHeight * 0.01),
            left: 0,
            child: Image.asset('assets/images/777.png', width: screenWidth * 0.5),
          ),
          // Main Image
          Positioned(
            top: screenHeight * 0.20,
            width: screenWidth,
            height: screenHeight * 0.3,
            child: Image.asset('assets/images/999.png', fit: BoxFit.contain),
          ),
          // "Empowering Agriculture..." Text
          Positioned(
            bottom: screenHeight * 0.04,
            left: screenWidth * 0.04,
            right: screenWidth * 0.05,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.12),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045, fontWeight: FontWeight.w400, height: 1.5),
                  children: <TextSpan>[
                    const TextSpan(text: 'Empowering '),
                    TextSpan(text: 'Agriculture', style: TextStyle(color: textGreen, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.055)),
                    const TextSpan(text: '\nwith Easy Access to '),
                    TextSpan(text: 'Labor &\nTechnology...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.055)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// This widget builds the bottom white form section for OTP entry.
  Widget _buildBottomFormSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const Color buttonGreen = Color(0xff3DBB5B);

    // Define the theme for the Pinput boxes to match your original design
    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.13,
      height: screenWidth * 0.14,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.05,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: buttonGreen, width: 2.0),
    );
    
    // The submitted theme can be the same as the focused one to show completion
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
       border: Border.all(color: buttonGreen, width: 2.0),
    );


    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenHeight * 0.04,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prompt Text
          Text(
            "Enter 6 digit OTP received on your phone.",
            style: TextStyle(
              fontSize: screenWidth * 0.042,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
          ),
          SizedBox(height: screenHeight * 0.03),

          // THE OTP INPUT IMPLEMENTATION using Pinput
          Center(
            child: Pinput(
              length: 6,
              controller: _otpController,
              focusNode: _focusNode,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: (value) {
                // This setState is crucial to update the button's state
                setState(() {});
              },
              onCompleted: (pin) {
                print('OTP completed: $pin');
                // You could also trigger submission here directly
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.04),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _otpController.text.length == 6
                  ? () {
                      print("Submitting OTP: ${_otpController.text}");
                      // Navigate to success screen and remove all previous routes
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>  HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  : null, // Button is disabled if OTP is not 6 digits
              style: ElevatedButton.styleFrom(
                backgroundColor: _otpController.text.length == 6 ? buttonGreen : Colors.grey.shade300,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: _otpController.text.length == 6 ? Colors.white : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}