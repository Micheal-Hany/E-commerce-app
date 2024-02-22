
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';
class SwitchSettingCard extends StatelessWidget {
  final WalletController controller;

  const SwitchSettingCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.myTheme.cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '153'.tr,
            style: context.bodyLarge,
          ),
          Obx(() => Switch(
                value: controller.selectedLanguage.value == 'en',
                activeColor: const Color(0xff4BC76D),
                onChanged: (bool value) {
                  controller.changeLang(value ? 'en' : 'ar');
                },
              )),
        ],
      ),
    );
  }
}
