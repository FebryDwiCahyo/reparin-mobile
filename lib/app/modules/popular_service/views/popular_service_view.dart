import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reparin_mobile/app/modules/popular_service/controllers/popular_service__controller.dart';
import 'package:reparin_mobile/app/modules/navbar/views/navbar_view.dart'; // Assuming the custom navigation bar exists

class PopularServiceView extends GetView<PopularServiceController> {
  const PopularServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Popular Services',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality if required
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.serviceList.length,
          itemBuilder: (context, index) {
            final item = controller.serviceList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 2.0,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      item['price'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['provider'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.bookmark_border,
                  color: Color(0xFF0093B7),
                ),
                onTap: () {
                  // Navigate to the specific route based on the service
                  switch (item['title']) {
                    case 'Mobile Device Repair':
                      Get.toNamed('/mobile_device_repair'); // Replace with your actual route
                      break;
                    case 'Laptop Repair':
                      Get.toNamed('/service/page'); // Replace with your actual route
                      break;
                    case 'Smartphone Repair':
                      Get.toNamed('/smartphone_repair'); // Replace with your actual route
                      break;
                    case 'Camera Repair':
                      Get.toNamed('/camera_repair'); // Replace with your actual route
                      break;
                    default:
                      // Handle the default case if needed
                      break;
                  }
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: const CustomBottomNavigationBar(), // Custom bottom navigation bar
    );
  }
}
