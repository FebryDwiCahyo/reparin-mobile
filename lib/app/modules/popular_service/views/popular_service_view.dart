import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reparin_mobile/app/modules/popular_service/controllers/popular_service__controller.dart';
import 'package:reparin_mobile/app/modules/navbar/views/navbar_view.dart';

import '../../booking_service/controllers/booking_service_controller.dart';
import '../../booking_service/views/booking_service_view.dart'; // Assuming the custom navigation bar exists

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
                    Get.to(
                      () => ServiceBookingView(
                        serviceType: item['title'],
                        providerName: item['provider'],
                        price: double.parse(item['price'].replaceAll('\$', '')),
                      ),
                      binding: BindingsBuilder(() {
                        Get.lazyPut(() => ServiceBookingController());
                      }),
                    );
                  }),
            );
          },
        );
      }),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Custom bottom navigation bar
    );
  }
}
