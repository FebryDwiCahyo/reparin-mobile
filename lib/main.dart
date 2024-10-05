import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Color(0xFF0083B3), // Warna aksen
        scaffoldBackgroundColor: Colors.white, // Warna latar belakang
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Warna teks
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.white), // Warna teks judul di AppBar
        ),
      ),
    ),
  );
}
