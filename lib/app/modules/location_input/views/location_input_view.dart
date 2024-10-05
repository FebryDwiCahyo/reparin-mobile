import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/location_input_controller.dart';

class LocationInputView extends GetView<LocationInputController> {
  const LocationInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Enter Your Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Galaxy Mall Surabaya',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clearSearch,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: controller.onSearchChanged,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: controller.useCurrentLocation,
              child: const Row(
                children: [
                  Icon(Icons.my_location, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Use my current location', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => controller.searchResults.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SEARCH RESULT', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text(controller.searchResults[index].name),
                          subtitle: Text(controller.searchResults[index].address),
                          onTap: () => controller.selectLocation(controller.searchResults[index]),
                        );
                      },
                    ),
                  ],
                )
              : const SizedBox.shrink()
            ),
          ],
        ),
      ),
    );
  }
}