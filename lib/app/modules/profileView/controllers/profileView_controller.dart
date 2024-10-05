import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/profile_model.dart';

class ProfileViewController extends GetxController {
  final Rx<Profile> profile = Profile(
    name: '',
    phone: '',
    email: '',
  ).obs;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Initialize with dummy data
    // profile.value = Profile(
    //   name: 'Dave',
    //   phone: '12345678',
    //   email: 'dave@gmail.com',
    // );

    nameController = TextEditingController(text: profile.value.name.value);
    phoneController = TextEditingController(text: profile.value.phone.value);
    emailController = TextEditingController(text: profile.value.email.value);

    // Listen to changes in text controllers and update profile
    nameController
        .addListener(() => profile.value.name.value = nameController.text);
    phoneController
        .addListener(() => profile.value.phone.value = phoneController.text);
    emailController
        .addListener(() => profile.value.email.value = emailController.text);
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      profile.update((val) {
        val!.imagePath.value = pickedFile.path;
      });
    }
  }

  void updateProfile() {
    // Here you would typically send the updated profile to a server
    // For now, we'll just update the local profile object
    profile.update((val) {
      val!.name.value = nameController.text;
      val.phone.value = phoneController.text;
      val.email.value = emailController.text;
    });

    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
