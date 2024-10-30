import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../data/models/service_order_model.dart';
import '../../../data/models/profile_model.dart';

class ServiceBookingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  final Rx<Profile> userProfile = Profile.empty().obs;
  final RxBool isLoading = false.obs;
  
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final doc = await _firestore.collection('users').doc(userId).get();
        if (doc.exists) {
          userProfile.value = Profile.fromFirestore(doc);
        }
      }
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  Future<bool> createServiceOrder({
    required String serviceType,
    required String providerName,
    required double price,
  }) async {
    try {
      isLoading.value = true;
      
      final userId = _auth.currentUser?.uid;
      if (userId == null) {
        Get.snackbar('Error', 'Please login first');
        return false;
      }

      final serviceOrder = ServiceOrder(
        userId: userId,
        serviceType: serviceType,
        providerName: providerName,
        price: price,
        description: descriptionController.text,
        userPhone: userProfile.value.phone.value,
        userEmail: userProfile.value.email.value,
        userName: userProfile.value.name.value,
        orderDate: DateTime.now(),
        address: addressController.text,
      );

      // Create the order in Firestore
      await _firestore.collection('service_orders').add(serviceOrder.toJson());
      
      Get.snackbar(
        'Success',
        'Service order created successfully',
        snackPosition: SnackPosition.TOP,
      );
      
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create service order: $e',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    descriptionController.dispose();
    addressController.dispose();
    super.onClose();
  }
}