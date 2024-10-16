// File: /lib/app/modules/getconnect/controllers/getconnect_controller.dart

import 'package:get/get.dart';
import '../models/address.dart';

class GetConnectController extends GetxController {
  static const String _nominatimUrl = 'https://nominatim.openstreetmap.org/search';

  RxList<Welcome> addresses = RxList<Welcome>([]);
  RxBool isLoading = false.obs;


  Future<void> searchAddress(String query) async {
    try {
      isLoading.value = true;
      final response = await GetConnect().get(
        '$_nominatimUrl?q=$query&format=json&addressdetails=1',
      );

      if (response.statusCode == 200) {
        final addressData = response.body as List;
        final addressList = addressData.map((addressJson) => Welcome.fromJson(addressJson)).toList();
        addresses.assignAll(addressList);
      } else {
        print("Request failed with status ${response.statusCode}");
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
