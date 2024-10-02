import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var imagePath = ''.obs; // Menyimpan path gambar yang dipilih
  final ImagePicker _picker = ImagePicker(); // Instance ImagePicker

  // Method untuk memilih gambar
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path; // Update path gambar
    } else {
      // Tindakan jika tidak ada gambar yang dipilih
      imagePath.value = '';
    }
  }
}
