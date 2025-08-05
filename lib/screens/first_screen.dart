import 'package:flutter/material.dart';
import 'second_screen.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const Color primaryGreen = Color(0xff0b2813);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.65,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Image.asset(
                      'assets/images/111.png',
                      height: screenHeight * 0.55,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.agriculture_outlined,
                          size: screenWidth * 0.35,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: screenHeight * 0.35),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
                vertical: screenHeight * 0.04,
              ),
              color: primaryGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Finding Skilled Workers, Simplified",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.09,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        "Book in advance to get the work done timely and get real time updates.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),

                  // bottom indicators and button
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPageIndicator(
                              isActive: true, screenHeight: screenHeight),
                          SizedBox(width: screenWidth * 0.02),
                          _buildPageIndicator(
                              isActive: false, screenHeight: screenHeight),
                          SizedBox(width: screenWidth * 0.02),
                          _buildPageIndicator(
                              isActive: false, screenHeight: screenHeight),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: primaryGreen,
                            size: screenWidth * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(
      {required bool isActive, required double screenHeight}) {
    return Container(
      height: isActive ? screenHeight * 0.012 : screenHeight * 0.01,
      width: isActive ? screenHeight * 0.012 : screenHeight * 0.01,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white30,
      ),
    );
  }
}
