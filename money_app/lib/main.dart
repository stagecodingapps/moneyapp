import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: "Application",
      initialRoute: AppPages.INITIAL, //Routes.LOAN, //
      getPages: AppPages.routes,
    ),
  );
}
