import 'package:flutter/material.dart';
import 'fourth_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const Color primaryGreen = Color(0xff0b2813);

    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: screenHeight * 0.65, 
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.07),
                        child: Image.asset(
                          'assets/images/333.png',
                          height: screenHeight * 0.55,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.checklist_rtl,
                              size: screenWidth * 0.35,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom green container 
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: screenHeight * 0.35, 
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06, 
                    vertical: screenHeight * 0.035, 
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
                            "Drone Spraying",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                           
                              fontSize: screenWidth * 0.11,
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
                              
                                padding: EdgeInsets.only(left: screenWidth * 0.195),
                                child: _buildBulletPoint("Book service in a Few Tabs", screenWidth),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Padding(
                             
                                padding: EdgeInsets.only(left: screenWidth * 0.125),
                                child: _buildBulletPoint("Precise and Efficient Crop Protection", screenWidth),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.125),
                                child: _buildBulletPoint("Save cost on fertilizer and Pesticides ", screenWidth),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                    
                      Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                            SizedBox(height: screenHeight * 0.02), 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildPageIndicator(isActive: false, screenWidth: screenWidth),
                                _buildPageIndicator(isActive: false, screenWidth: screenWidth),
                                _buildPageIndicator(isActive: true, screenWidth: screenWidth),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03), 
                            GestureDetector(
                              onTap: () {
                              
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  LanguageSelectionScreen()),
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

  Widget _buildPageIndicator({required bool isActive, required double screenWidth}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), 
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}