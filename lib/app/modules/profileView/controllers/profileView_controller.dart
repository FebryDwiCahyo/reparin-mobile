import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/profile_model.dart';

class ProfileViewController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  final profile = Rx<Profile>(Profile.empty());
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

Future<void> updateProfileImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  
  if (image != null) {
    profile.update((val) {
      if (val != null) val.imagePath.value = image.path;
    });
    // TODO: Implement Firebase Storage upload if needed
  }
}
  
  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }
  
  Future<void> loadUserProfile() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot doc = await _firestore
            .collection('users')
            .doc(currentUser.uid)
            .get();
            
        if (doc.exists) {
          profile.value = Profile.fromFirestore(doc);
        }
      }
    } catch (e) {
      print('Error loading profile: $e');
    }
  }
  Future<bool> updateProfile() async {
  try {
    final userData = profile.value.toJson();
    await _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .update(userData);
    return true;
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to update profile: $e',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
    );
    return false;
  }
}

@override
void onClose() {
  nameController.dispose();
  phoneController.dispose();
  emailController.dispose();
  super.onClose();
}
}