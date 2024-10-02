import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awog-Awog'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2, // Jumlah kolom di grid
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFeatureCard(
            context,
            title: 'Image Picker',
            icon: Icons.add_a_photo,
            onTap: () {
              Get.toNamed(Routes.IMAGE_PICKER);
            },
          ),
          // Tambahkan fitur lain di sini
          _buildFeatureCard(
            context,
            title: 'Fitur 2',
            icon: Icons.featured_play_list,
            onTap: () {
              // Tambahkan logika untuk fitur 2
            },
          ),
          _buildFeatureCard(
            context,
            title: 'Fitur 3',
            icon: Icons.settings,
            onTap: () {
              // Tambahkan logika untuk fitur 3
            },
          ),
          _buildFeatureCard(
            context,
            title: 'Fitur 4',
            icon: Icons.info,
            onTap: () {
              // Tambahkan logika untuk fitur 4
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
