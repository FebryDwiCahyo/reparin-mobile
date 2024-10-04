import 'package:flutter/material.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text('My Bookings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildBookingsList(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem('Upcoming', isSelected: true),
          _buildTabItem('Completed'),
          _buildTabItem('Cancelled'),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, {bool isSelected = false}) {
    return Text(
      title,
      style: TextStyle(
        color: isSelected ? Colors.blue : Colors.grey,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildBookingsList() {
    return ListView(
      children: [
        _buildBookingItem(
          'Mobile Device Repair',
          '\$15.00',
          'Jenny Wilson',
          'assets/mobile_repair.jpg',
        ),
        _buildBookingItem(
          'Laptop Repair',
          '\$15.00',
          'Bob',
          'assets/laptop_repair.jpg',
        ),
      ],
    );
  }

  Widget _buildBookingItem(
      String title, String price, String technician, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(price),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 16),
                          const SizedBox(width: 4),
                          Text(technician),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle View More button press
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 36),
              ),
              child: const Text('View More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'Location'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'Bookings'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 2, // Bookings tab is selected
      selectedItemColor: Colors.blue,
    );
  }
}
