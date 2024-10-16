// File: /lib/app/modules/getconnect/views/getconnect_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/getconnect_controller.dart';

class GetConnectView extends GetView<GetConnectController> {
  const GetConnectView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Alamat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama lokasi...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    String query = searchController.text;
                    if (query.isNotEmpty) {
                      controller.searchAddress(query);
                    }
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.addresses.isEmpty) {
              return const Center(
                child: Text('Tidak ada hasil pencarian.'),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.addresses.length,
                  itemBuilder: (context, index) {
                    final address = controller.addresses[index];
                    return ListTile(
                      title: Text(address.displayName),
                      subtitle: Text(
                        '${address.address.city ?? address.address.village ?? 'N/A'}, ${address.address.country}',
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
