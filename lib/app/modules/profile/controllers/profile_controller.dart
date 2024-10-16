import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../profileView/controllers/profileView_controller.dart';

class ProfileController extends GetxController {
  late final ProfileViewController _profileViewController;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi ProfileViewController di sini
    if (!Get.isRegistered<ProfileViewController>()) {
      Get.put(ProfileViewController());
    }

    _profileViewController = Get.find<ProfileViewController>();

    // Memastikan profileViewController sudah diinisialisasi
    ever(_profileViewController.profile, (_) => update());
  }

  Rx<String> get imagePath => _profileViewController.profile.value.imagePath;
  Rx<String> get name => _profileViewController.profile.value.name;
  Rx<String> get phone => _profileViewController.profile.value.phone;
  Rx<String> get email => _profileViewController.profile.value.email;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _profileViewController.profile.update((val) {
        val!.imagePath.value = image.path;
      });
    }
  }

  Future<void> signOut() async {
    Get.offAllNamed('/login');
  }

  void updateProfile({String? name, String? phone, String? email}) {
    _profileViewController.profile.update((val) {
      if (name != null) val!.name.value = name;
      if (phone != null) val!.phone.value = phone;
      if (email != null) val!.email.value = email;
    });
  }
}
