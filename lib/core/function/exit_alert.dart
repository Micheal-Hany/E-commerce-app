import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: 'Alrt',
      titleStyle: TextStyle(color: ColorConstant.primary),
      middleText: 'Do you want to Exit the App',
      middleTextStyle: TextStyle(color: ColorConstant.primary),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cansle')),
        TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('Exit'))
      ]);
  return Future.value(true);
}
