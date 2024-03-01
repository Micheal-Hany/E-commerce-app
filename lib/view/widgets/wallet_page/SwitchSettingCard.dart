import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/wallet_page/LanguageOption.dart';

class SwitchSettingCard extends StatelessWidget {
  final WalletController controller;

  const SwitchSettingCard({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '153'.tr,
                style: context.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LanguageOption(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/US_flag_51_stars.svg/1235px-US_flag_51_stars.svg.png',
                language: 'English',
                selected: controller.selectedLanguage.value == 'en',
                onTap: () {
                  controller.changeLang('en');
                },
              ),
              LanguageOption(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/800px-Flag_of_Egypt.svg.png',
                language: 'العربية',
                selected: controller.selectedLanguage.value == 'ar',
                onTap: () {
                  controller.changeLang('ar');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
