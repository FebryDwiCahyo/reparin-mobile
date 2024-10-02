import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_picker_controller.dart';
import 'dart:io';

class ImagePickerView extends GetView<ImagePickerController> {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Image'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return controller.imagePath.value.isNotEmpty
              ? Image.file(
                  File(controller.imagePath.value),
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                )
              : const Text('No image selected');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.pickImage(); // Memanggil method untuk memilih gambar
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
