import 'package:get/get.dart';
import 'package:mobile_app_test/app/modules/home/bindings/login_binding.dart';
import 'package:mobile_app_test/app/modules/home/views/login_view.dart';
import '../modules/home/bindings/image_picker_binding.dart';
import '../modules/home/views/image_picker_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const LOGIN = Routes.LOGIN;


  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_PICKER,
      page: () => const ImagePickerView(),
      binding: ImagePickerBinding(),
    ),
  ];
}
