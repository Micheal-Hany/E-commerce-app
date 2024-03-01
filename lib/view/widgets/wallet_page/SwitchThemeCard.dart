import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';
import '../../../controller/Home/wallet_controller.dart';

class SwitchThemeCard extends StatelessWidget {
  final WalletController controller;

  const SwitchThemeCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.myTheme.cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '152'.tr,
            style: context.bodyLarge,
          ),
          Obx(() => Switch(
                value: controller.isDarkMode.value,
                activeColor: const Color(0xff4BC76D),
                onChanged: (bool value) {
                  controller.toggleTheme();
                },
              )),
        ],
      ),
    );
  }
}
