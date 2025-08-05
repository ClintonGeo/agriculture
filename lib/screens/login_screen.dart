import 'package:flutter/material.dart';

import 'otp_screen.dart';

class AmshaLoginScreen extends StatefulWidget {
  const AmshaLoginScreen({Key? key}) : super(key: key);

  @override
  State<AmshaLoginScreen> createState() => _AmshaLoginScreenState();
}

class _AmshaLoginScreenState extends State<AmshaLoginScreen> {
  // --- MODIFICATION START ---
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // Controller to get the text from the TextFormField
  final _mobileNumberController = TextEditingController();
  // --- MODIFICATION END ---

  bool _agreedToTerms = false;

  // --- MODIFICATION START ---
  // Dispose the controller when the widget is disposed to free up resources
  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }
  // --- MODIFICATION END ---


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    const Color primaryGreen = Color(0xff0b2813);
    const Color buttonGreen = Color(0xff3DBB5B);
    const Color textGreen = Color(0xff3DBB5B);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP GREEN CONTAINER
            Container(
              height: screenHeight * 0.65,
              width: double.infinity,
              color: primaryGreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //  Background Shade
                  Positioned(
                    left: screenWidth * 0.05,
                    right: 0.0,
                    child: Image.asset(
                      'assets/images/888.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: const BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment.topCenter,
                              radius: 1.2,
                              colors: [Color(0xff2F6043), primaryGreen],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //  AMSHA Logo and Name
                  Positioned(
                    top: statusBarHeight + (screenHeight * 0.01),
                    left: 0,
                    child: Image.asset(
                      'assets/images/777.png',
                      // Converted static 200px to a responsive value
                      width: screenWidth * 0.5,
                      // Height is removed to allow the image to scale proportionally
                      errorBuilder: (c, e, s) =>
                      const Icon(Icons.spa, color: Colors.white, size: 35),
                    ),
                  ),

                  //  Main image
                  Positioned(
                    top: screenHeight * 0.20,
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    child: Image.asset(
                      'assets/images/999.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.landscape,
                          size: 150,
                          color: Colors.white24,
                        );
                      },
                    ),
                  ),

                  Positioned(
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.05,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.12), // 50
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045, // 18
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: 'Empowering '),
                            TextSpan(
                              text: ' Agriculture',
                              style: TextStyle(
                                color: textGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.055, // 22
                              ),
                            ),
                            const TextSpan(text: '\nwith Easy Access to '),
                            TextSpan(
                              text: 'Labor &\nTechnology...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.055, // 22
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM WHITE CONTAINER
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06, // 24
                  vertical: screenHeight * 0.04), // 32
              color: Colors.white,
           
              child: Form(
                key: _formKey,
                child: Column(
            
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get Started with Amsha",
                      style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87), // 20
                    ),
                    SizedBox(height: screenHeight * 0.03), // 24
                    Text(
                      "Enter Mobile Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.038,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFormField(
                  
                      controller: _mobileNumberController,
                      maxLength: 10, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a mobile number';
                        }
                        if (value.length != 10) {
                          return 'Mobile number must be 10 digits';
                        }
                        return null; 
                      },
                     
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: "", 
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: screenWidth * 0.025),
                            Image.asset('assets/images/india.png',
                                width: screenWidth * 0.075),
                            const Icon(Icons.arrow_drop_down, color: Colors.grey),
                            SizedBox(width: screenWidth * 0.012),
                          ],
                        ),
                        hintText: "Enter your mobile number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.012),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (bool? value) =>
                              setState(() => _agreedToTerms = value ?? false),
                          activeColor: primaryGreen,
                          visualDensity: VisualDensity.compact,
                        ),
                        Expanded(
                          child: Text(
                            "I agree to the terms of use & privacy policy",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenWidth * 0.03),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03), 
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                       
                        onPressed: () {
                          
                          if (!_agreedToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please agree to the terms of use & privacy policy.'),
                              ),
                            );
                            return; 
                          }

                         
                          if (_formKey.currentState!.validate()) {
                         
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const OtpScreen()),
                            );
                          }
                        },
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonGreen,
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02), // 16
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Log in with OTP",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white), // 16
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}