import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';

customSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.blueGrey[900], // Background color
    colorText: Colors.white, // Text color
    borderRadius: 10, // BorderRadius
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(16), // Margin
    padding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Padding
    duration: const Duration(seconds: 4), // Duration to display the snackbar
    forwardAnimationCurve: Curves.easeOutBack, // Animation curve
    barBlur: 20, // Blur effect for the snackbar
    isDismissible: true, // Allow user to dismiss the snackbar
    dismissDirection: DismissDirection.horizontal, // Dismiss direction
    icon: const Icon(Icons.info_outline, color: Colors.white), // Icon
    shouldIconPulse: true, // Pulse animation for the icon
    maxWidth: Get.width * 0.8, // Maximum width for the snackbar
    animationDuration: const Duration(milliseconds: 400), // Animation duration
    overlayBlur: 0, // Blur effect for the overlay
    overlayColor: Colors.transparent, // Overlay color
    snackPosition: SnackPosition.BOTTOM, // Snackbar position
    mainButton: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        '128'.tr,
        style: TextStyle(color: ColorConstant.manatee), // Button text color
      ),
    ), // Main button
    onTap: (_) {
      Get.back();
    }, // Callback when snackbar is tapped
  );
}
