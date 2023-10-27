import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: 'Alrt',
      middleText: 'Do you want to Exit the App',
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
