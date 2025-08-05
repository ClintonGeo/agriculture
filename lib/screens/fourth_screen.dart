import 'package:flutter/material.dart';

import 'login_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;
  final List<String> _languages = ['English', 'हिन्दी', 'తెలుగు', 'தமிழ்'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const Color primaryGreen = Color(0xff0b2813);

    return Scaffold(
      backgroundColor: primaryGreen,
      body: SafeArea(
        child: Column(
          children: [
            //  TOP GREEN CONTAINER
            Container(
              width: double.infinity,
              height: screenHeight * 0.55,
              color: primaryGreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //   SHADOW ALIGNMENT

                  Positioned(
                    top: 80,
                    bottom: 160,
                    left: 0,
                    width: screenWidth * 0.75,
                    child: Image.asset(
                      'assets/images/444.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topLeft,
                      errorBuilder: (c, e, s) => const SizedBox(),
                    ),
                  ),

                  // The guy thinking image
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: Image.asset(
                      'assets/images/pana.png',
                      fit: BoxFit.contain,
                      errorBuilder: (c, e, s) => const Icon(Icons.person,
                          size: 150, color: Colors.white24),
                    ),
                  ),

                  // 2. POSITIONED LANGUAGE TEXTS
                  _buildLanguageText(context,
                      text: "தமிழ்", top: 0.1, left: 0.12,color:  Color(0xff099b0d)),
                  _buildLanguageText(context,
                      text: "తెలుగు", top: 0.12, right: 0.38,color:  Color(0xff099b0d)),
                  _buildLanguageText(context,
                      text: "हिन्दी", top: 0.22, left: 0.14,color:  Color(0xff099b0d)),
                  _buildLanguageText(context,
                      text: "English", top: 0.22, right: 0.2,color:  Color(0xff099b0d)),

                  Positioned(
                    top: screenHeight * 0.38,
                    right: screenWidth * 0.28,
                    child: const Text(
                      "?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic),
                    ),
                  ),

                  // The language icon in the bubble
                  Positioned(
                    top: screenHeight * 0.12,
                    right: screenWidth * 0.12,
                   
                    child: SizedBox(
                      height: screenHeight * 0.08,
                      width: screenHeight *
                          0.08, 
                      child: Container(
                       
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        decoration: const BoxDecoration(
                          color: Colors
                              .white,
                          shape: BoxShape
                              .circle, 
                        ),
                        child: Image.asset(
                          'assets/images/555.png',
                          errorBuilder: (c, e, s) => const SizedBox(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // BOTTOM WHITE CONTAINER
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08,
                  vertical: screenHeight * 0.03,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose your Language",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    DropdownButtonFormField<String>(
                      value: _selectedLanguage,
                      hint: const Text("Select Language",
                          style: TextStyle(color: Colors.grey)),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      items: _languages.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLanguage = newValue;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      "Select your preferred language from the dropdown",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (_selectedLanguage != null) {
                          Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AmshaLoginScreen()),
      );
                          print("Selected language: $_selectedLanguage");
                          // Navigate to the next screen
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.018),
                        decoration: BoxDecoration(
                          color: _selectedLanguage != null
                              ? primaryGreen
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedLanguage != null
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  position the language texts
  Widget _buildLanguageText(
    BuildContext context, {
    required String text,
     required Color color,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: top != null ? screenHeight * top : null,
      bottom: bottom != null ? screenHeight * bottom : null,
      left: left != null ? screenWidth * left : null,
      right: right != null ? screenWidth * right : null,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
