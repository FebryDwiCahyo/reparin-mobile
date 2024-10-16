import 'package:get/get.dart';

class PopularServiceController extends GetxController {
  // List of popular services
  var serviceList = <Map<String, dynamic>>[
    {
      'title': 'Mobile Device Repair',
      'price': '\$15.00',
      'provider': 'Jenny Wilson',
      'image': 'assets/device_repair.png', // Sample image path
    },
    {
      'title': 'Laptop Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/laptop_repair.png',
    },
    {
      'title': 'Smartphone Repair',
      'price': '\$15.00',
      'provider': 'Bob',
      'image': 'assets/smartphone_repair.png',
    },
    {
      'title': 'Camera Repair',
      'price': '\$15.00',
      'provider': 'Alan',
      'image': 'assets/camera_repair.png',
    },
  ].obs; // Observing the list for changes
}
