import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  
  bool _isLocationSelected = false;

  
  GoogleMapController? _mapController;
 
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-6.2088, 106.8456), 
    zoom: 12,
  );

 
  void _onLocationSelect() {
    setState(() {
      _isLocationSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF146048),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Booking Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
         
          _buildStepper(isStep2Active: _isLocationSelected),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    _buildLocateLandSection(),

                   
                    if (_isLocationSelected) ...[
                      const SizedBox(height: 24),
                      _buildAddressSection(),
                      const SizedBox(height: 30),
                      _buildContinueButton(),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper({bool isStep2Active = false}) {
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStep(number: '1', label: 'Add\nAddress', isActive: true),
          _buildStepConnector(isActive: isStep2Active),
          _buildStep(number: '2', label: 'Land\nDetails', isActive: isStep2Active),
          _buildStepConnector(),
          _buildStep(number: '3', label: 'Payment\nDetails', isActive: false),
        ],
      ),
    );
  }

  Widget _buildStep({required String number, required String label, bool isActive = false}) {
    final activeColor = Colors.white;
    final inactiveColor = Colors.white.withOpacity(0.5);
    final activeBgColor = const Color(0xFF146048);
    final inactiveBgColor = Colors.transparent;

    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeColor : inactiveBgColor,
            border: Border.all(color: isActive ? activeColor : inactiveColor, width: 1.5),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: isActive ? activeBgColor : inactiveColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? activeColor : inactiveColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector({bool isActive = false}) {
    return Expanded(
      child: Container(
        height: 1.5,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        margin: const EdgeInsets.only(bottom: 30, left: 4, right: 4),
      ),
    );
  }

  Widget _buildLocateLandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Locate your Land',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
       
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
         
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) {
                _mapController = controller;
              },
             
              markers: {
                const Marker(
                  markerId: MarkerId('land_location'),
                  position: LatLng(-6.2088, 106.8456),
                )
              },
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        TextField(
          decoration: InputDecoration(
            hintText: 'Search for your land',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF146048)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          ),
        ),
        const SizedBox(height: 12),
      
        InkWell(
          onTap: _onLocationSelect, 
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300)),
            child: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Bengaluru, Jayanagar 4th Block',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildTextField(label: 'Address Line 1'),
        const SizedBox(height: 16),
        _buildTextField(label: 'Address Line 2'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildTextField(label: 'State')),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField(label: 'District')),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField(label: 'Pin Code'),
        const SizedBox(height: 16),
        _buildTextField(label: 'Any instructions related to reaching location', maxLines: 3),
      ],
    );
  }

  Widget _buildTextField({required String label, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF146048), width: 2),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff146048),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}