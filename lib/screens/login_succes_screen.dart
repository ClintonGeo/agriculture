import 'package:figma_scroll/screens/transplantation_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentNavIndex = 0;

  final List<Map<String, String>> cropData = [
    {'image': 'assets/images/workforce1.png', 'name': 'Paddy'},
    {'image': 'assets/images/workforce2.png', 'name': 'Chili'},
    {'image': 'assets/images/workforce3.png', 'name': 'Sugarcane'},
    {'image': 'assets/images/workforce4.png', 'name': 'Pomegranate'},
    {'image': 'assets/images/workforce5.png', 'name': 'Cotton'},
    {'image': 'assets/images/workforce6.png', 'name': 'Onion'},
    {'image': 'assets/images/workforce7.png', 'name': 'Tomato'},
    {'image': 'assets/images/workforce8.png', 'name': 'Turmeric'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.055,
              ),
            ),
            SizedBox(height: screenHeight * 0.003),
            Text(
              'JP Nagar 1st Phase, Bengaluru',
              style: TextStyle(
                color: Colors.black87,
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: screenWidth * 0.07,
            ),
            onPressed: () {},
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
             behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    height: screenHeight * 0.25,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            child: Image.asset(
                              'assets/images/home1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(3, (index) => _buildDotIndicator(index, screenWidth)),
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  _buildSectionHeader(
                      title: 'Paddy',
                      subtitle: 'Select your Required Service',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  SizedBox(height: screenHeight * 0.015),
                  _buildServicesList(screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  _buildSectionHeader(
                      title: 'Hire Workforce',
                      subtitle: 'Choose your crop and skill',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  SizedBox(height: screenHeight * 0.012),
                  _buildCropGrid(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.006),
                  _buildSectionHeader(
                      title: 'Drone Services',
                      subtitle: 'Choose the crop you need help with',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  SizedBox(height: screenHeight * 0.012),
                  _buildFutureBanner(screenWidth),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.1,
              margin: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: screenHeight * 0.012,
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.025),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                      icon: Icons.home_filled,
                      label: 'Home',
                      index: 0,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  _buildNavItem(
                      icon: Icons.bookmark_border,
                      label: 'Bookings',
                      index: 1,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  _buildNavItem(
                      icon: Icons.person_outline,
                      label: 'Profile',
                      index: 2,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required double screenWidth,
    required double screenHeight,
  }) {
    bool isSelected = _currentNavIndex == index;
    final Color activeColor = Color(0xFF36A47C);
    final Color inactiveColor = Colors.black87;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentNavIndex = index;
        });
      },
      child: Container(
        color: Colors.transparent,
        height: screenHeight * 0.08,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? activeColor : inactiveColor,
                    size: screenWidth * 0.065,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: isSelected ? activeColor : inactiveColor,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: screenHeight * 0.004,
                 width: screenWidth * 0.80, 
                  color: isSelected ? activeColor : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int index, double screenWidth) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      height: screenWidth * 0.02,
      width: _currentPage == index ? screenWidth * 0.06 : screenWidth * 0.02,
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xFF36A47C) : Colors.grey[400],
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: screenHeight * 0.005),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.black54,
              ),
            ),
          ]
        ],
      ),
    );
  }
Widget _buildServicesList(double screenWidth) {
  final cardWidth = screenWidth * 0.6;
  final imageWidth = cardWidth * 0.35;
  final cardHeight = 90.0;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    clipBehavior: Clip.none,
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
    child: Row(
      children: [
        // First Card
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransplantationScreen()),
            );
          },
          child: Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/paddy222.png',
                    width: imageWidth,
                    height: cardHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:6,bottom:10,right:6.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Transplantation',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Grow Healthy seedings',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '₹5,500/acre',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: screenWidth * 0.04),

        // Second Card
        Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/paddy111.png',
                  width: imageWidth,
                  height: cardHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:6,bottom:10,right:6.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Drone Services',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Efficient Spraying',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '₹700/acre-',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                           Text(
                            'Offer:₹500/acre',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


 Widget _buildCropGrid(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 0,
          childAspectRatio: 0.8,
        ),
        itemCount: cropData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.07,
                width: screenWidth * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  child: Image.asset(
                    cropData[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.008),
              Text(
                cropData[index]['name']!,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFutureBanner(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: Image.asset('assets/images/drone.png'),
      ),
    );
  }
}
