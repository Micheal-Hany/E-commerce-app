import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController languageController = Get.put(WalletController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomWalletPageAppBar(),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Change Language",
                    style: CustomStyle.textStyle17,
                  ),
                  Obx(() => Switch(
                        value:
                            languageController.selectedLanguage.value == 'en',
                        activeColor: const Color(0xff4BC76D),
                        onChanged: (bool value) {
                          languageController.changeLang(value ? 'en' : 'ar');
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Change Theme",
                    style: CustomStyle.textStyle17,
                  ),
                  Obx(() => Switch(
                        value: languageController.isDarkMode.value,
                        activeColor: const Color(0xff4BC76D),
                        onChanged: (bool value) {
                          languageController.toggleTheme();
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWalletPageAppBar extends GetView<HaomeScreenContollerImpl> {
  const CustomWalletPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () => controller.changePage(0),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(
          width: 120,
        ),
        Text(
          'Wallet',
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
