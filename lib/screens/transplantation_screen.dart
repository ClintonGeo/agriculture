import 'package:flutter/material.dart';

import 'booking_detail_screen.dart';
import 'login_succes_screen.dart';

class TransplantationScreen extends StatelessWidget {
  const TransplantationScreen({super.key});

  final List<Map<String, String>> testimonialData = const [
    {
      'imagePath': 'assets/images/testimonials.png',
      'text': 'Ramesh K, a farmer from Mandya, saw a 15% increase in yield.',
      'views': '1.2K views',
      'timeAgo': '2 weeks ago',
    },
    {
      'imagePath': 'assets/images/testimonials.png',
      'text': 'Sita G, from Telangana, found the service extremely efficient.',
      'views': '890 views',
      'timeAgo': '1 month ago',
    },
    {
      'imagePath': 'assets/images/testimonials.png',
      'text': 'The workforce was professional and completed the job on time.',
      'views': '2.5K views',
      'timeAgo': '3 weeks ago',
    },
    {
      'imagePath': 'assets/images/testimonials.png',
      'text': 'Highly recommend for any farmer looking for reliable help.',
      'views': '950 views',
      'timeAgo': '1 week ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderImage(context),
                  _buildMainContent(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          _buildBookNowButton(context),
          _buildAppBar(context),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Stack(
      children: [
       //main image
        Image.asset(
          'assets/images/header.png',
          height:
              MediaQuery.of(context).size.height * 0.5, // 30% of screen height
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ),

        // Positioned the text block
        Positioned(
          bottom: 18,
          left: 14,
          right: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(
                child: Text(
                  'Paddy\nTransplantation.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Price / Acre',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹ 5,500/-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transplantation',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff146048)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Transplanting is a traditional agricultural technique that involves transferring young seedlings from a nursery to the main field. This method ensures optimal plant growth, higher yields, and better crop quality.',
            style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
          ),
          const SizedBox(height: 24),
          _buildSectionWithLine(
            title: 'Our Experienced Workers',
            child: Column(
              children: [
                _buildWorkersImageGrid(),
                const SizedBox(height: 20),
                _buildInfoRow(
                  icon: Icons.groups_2,
                  title: 'Experienced workers',
                  subtitle:
                      'Workers from major Paddy producing areas of the country with more than 1000 acres transplanted.',
                ),
                _buildInfoRow(
                  icon: Icons.spa,
                  title: 'Precision Planting',
                  subtitle:
                      'Our team ensures precise spacing and depth for optimal plant growth.',
                ),
                _buildInfoRow(
                  icon: Icons.access_time,
                  title: 'Timely Execution',
                  subtitle:
                      'We adhere to the ideal planting window for maximum yield.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionWithLine(
            title: 'Your Role in a Successful\nTransplantation',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'To ensure a smooth and efficient transplantation process, we kindly request you to provide the following:',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  icon: Icons.landslide,
                  title: 'Land Preparation',
                  subtitle:
                      'Ensure the field is well prepared and ready for transplantation',
                ),
                _buildInfoRow(
                  icon: Icons.home_work_outlined,
                  title: 'Stay Facilities',
                  subtitle:
                      'if required please arrange suitable accomadation for our skilled workforce.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionWithLine(
            title: 'Testimonials',
            child: _buildTestimonialsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionWithLine({required String title, required Widget child}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 22,
          color: const Color(0xFF36A47C),
          margin: const EdgeInsets.only(top: 4),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkersImageGrid() {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/workers1.png',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/workers2.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/workers3.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
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

  Widget _buildInfoRow(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF36A47C), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Using the new `testimonialData` list to build the cards
  Widget _buildTestimonialsList() {
    return SizedBox(
      height: 200, // Increased height to fit new text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: testimonialData.length,
        itemBuilder: (context, index) {
          final item = testimonialData[index];
          return _buildTestimonialCard(
            imagePath: item['imagePath']!,
            text: item['text']!,
            views: item['views']!,
            timeAgo: item['timeAgo']!,
          );
        },
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String imagePath,
    required String text,
    required String views,
    required String timeAgo,
  }) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          // NEW: Row for views and time metadata
          Row(
            children: [
              Text(
                views,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const Text(
                ' • ',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              Text(
                timeAgo,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBookNowButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: ElevatedButton(
         onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingDetailsScreen()),
          );
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff146048),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Book Now',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
