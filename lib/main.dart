import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reparin_mobile/app/modules/profile/controllers/profile_controller.dart';
import 'package:reparin_mobile/firebase_options.dart';
import 'app/data/services/authentication/controllers/authentication_controller.dart';
import 'app/modules/navbar/controllers/navbar_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/data/services/notification_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  Get.put(AuthenticationController(), permanent: true);
  Get.put(NavbarController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: const Color(0xFF0093B7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0093B7),
          surface: Colors.white,
        ),
        // scaffoldBackgroundColor: Color(0xFFF2F2F2), // Match the background color
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0093B7),
          titleTextStyle: TextStyle(
            // color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF0093B7),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF0093B7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF0093B7),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
