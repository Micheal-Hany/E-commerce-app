import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';

Future<void> customDialog(
    String title,
    String content,
    void Function()? onPressedOk,
    void Function()? onPressedCansle,
    String okLable,
    String canslelable) async {
  await Get.defaultDialog<bool>(
    // backgroundColor: Colors.grey,

    title: title,
    titleStyle: TextStyle(color: ColorConstant.primary),

    content: Text(
      content,
      style: TextStyle(color: ColorConstant.primary),
    ),
    actions: [
      TextButton(
        onPressed: onPressedOk,
        child: Text(okLable),
      ),
      TextButton(
        onPressed: onPressedCansle,
        child: Text(canslelable),
      ),
    ],
  );
}
