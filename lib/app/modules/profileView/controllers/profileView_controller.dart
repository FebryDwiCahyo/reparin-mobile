import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/profile_model.dart';
import 'dart:io';

class ProfileViewController extends GetxController {
  // State management
  final Rx<Profile> profile = Profile.empty().obs;
  final RxBool isLoading = false.obs;
  final RxBool isImageLoading = false.obs;
  final RxBool isEditing = false.obs;

  // Form controllers
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  // Image picker
  final ImagePicker _picker = ImagePicker();

  // Getters for form validation
  bool get isFormValid => 
    nameController.text.trim().isNotEmpty &&
    phoneController.text.trim().isNotEmpty &&
    emailController.text.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _loadProfile();
  }

  void _initializeControllers() {
    nameController = TextEditingController(text: profile.value.name.value);
    phoneController = TextEditingController(text: profile.value.phone.value);
    emailController = TextEditingController(text: profile.value.email.value);

    // Listen to changes in text controllers and update profile
    nameController.addListener(_updateProfileFromControllers);
    phoneController.addListener(_updateProfileFromControllers);
    emailController.addListener(_updateProfileFromControllers);
  }

  void _updateProfileFromControllers() {
    profile.update((val) {
      if (val != null) {
        val.name.value = nameController.text.trim();
        val.phone.value = phoneController.text.trim();
        val.email.value = emailController.text.trim();
      }
    });
  }

  Future<void> _loadProfile() async {
    try {
      isLoading.value = true;
      // Simulate loading from API or local storage
      await Future.delayed(const Duration(milliseconds: 500));
      
      // For testing purposes, you can uncomment this to load dummy data
      // profile.value = Profile(
      //   name: 'John Doe',
      //   phone: '1234567890',
      //   email: 'john@example.com',
      // );

      _updateControllersFromProfile();
    } catch (e) {
      _handleError('Error loading profile', e);
    } finally {
      isLoading.value = false;
    }
  }

  void _updateControllersFromProfile() {
    nameController.text = profile.value.name.value;
    phoneController.text = profile.value.phone.value;
    emailController.text = profile.value.email.value;
  }

  Future<void> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      isImageLoading.value = true;
      
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 75,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile != null) {
        // Verify if file exists and is accessible
        final File file = File(pickedFile.path);
        if (await file.exists()) {
          profile.update((val) {
            if (val != null) {
              val.imagePath.value = pickedFile.path;
            }
          });
        } else {
          throw Exception('Selected image file is not accessible');
        }
      }
    } catch (e) {
      _handleError('Failed to pick image', e);
    } finally {
      isImageLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
    if (!isFormValid) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Create updated profile
      final updatedProfile = profile.value.copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
      );

      // Here you would typically send the updated profile to a server
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Update local profile after successful API call
      profile.value = updatedProfile;

      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      isEditing.value = false;
    } catch (e) {
      _handleError('Failed to update profile', e);
    } finally {
      isLoading.value = false;
    }
  }

  void startEditing() {
    isEditing.value = true;
  }

  void cancelEditing() {
    isEditing.value = false;
    _updateControllersFromProfile(); // Reset form to current profile values
  }

  void _handleError(String message, dynamic error) {
    print('$message: $error'); // For debugging
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    // Dispose of controllers
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}