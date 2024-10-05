import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/faqcontrolers.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Help Center'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('FAQ', style: TextStyle(color: Colors.blue)),
              Text('Contact Us'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryButton('All'),
              _buildCategoryButton('Service'),
              _buildCategoryButton('General'),
              _buildCategoryButton('Account'),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.faqItems.length,
              itemBuilder: (context, index) {
                final item = controller.faqItems[index];
                return _buildExpandableTile(item.question, item.answer);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Obx(() => ElevatedButton(
      onPressed: () => controller.setCategory(category),
      child: Text(category),
      style: ElevatedButton.styleFrom(
        backgroundColor: controller.selectedCategory.value == category 
            ? Colors.blue 
            : Colors.grey[300],
        foregroundColor: controller.selectedCategory.value == category 
            ? Colors.white 
            : Colors.black,
      ),
    ));
  }

  Widget _buildExpandableTile(String title, String content) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content),
        ),
      ],
    );
  }
}