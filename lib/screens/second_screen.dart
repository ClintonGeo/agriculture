import 'package:flutter/material.dart';

import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const Color primaryGreen = Color(0xff0b2813);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Stack(
            children: [
              SizedBox(
                height: screenHeight,
                child: Column(
                  children: [
                    // Top white container
                    Expanded(
                      flex: 65,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.07),
                              child: Image.asset(
                                'assets/images/222.png',
                                height: screenHeight * 0.5,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.group_work_outlined,
                                    size: screenWidth * 0.35,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Bottom green container
                    Expanded(
                      flex: 35,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06,
                          vertical: screenHeight * 0.03,
                        ),
                        width: double.infinity,
                        color: primaryGreen,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Seamless Hiring,\nVerified Workers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.22),
                                  child: _buildBulletPoint(
                                      "Easily Hire verified workers.",
                                      screenWidth),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.17),
                                  child: _buildBulletPoint(
                                      "Advance booking and Transparent pricing.",
                                      screenWidth),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildPageIndicator(
                                    isActive: false,
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight),
                                _buildPageIndicator(
                                    isActive: true,
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight),
                                _buildPageIndicator(
                                    isActive: false,
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ThirdScreen()),
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
                      ),
                    )
                  ],
                ),
              ),
              // Back button
              Positioned(
                top: screenHeight * 0.05,
                left: screenWidth * 0.04,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                    size: screenWidth * 0.06,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.035,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(
      {required bool isActive,
      required double screenWidth,
      required double screenHeight}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      height: screenHeight * 0.007,
      width: isActive ? screenWidth * 0.05 : screenHeight * 0.007,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}
