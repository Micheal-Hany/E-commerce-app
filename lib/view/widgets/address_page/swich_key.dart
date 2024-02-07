import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/controller/address_fildes_page_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/payment_card_controller.dart';

class SwitchExample extends StatelessWidget {
  // final AddressPageController controller;

  const SwitchExample({
    // required this.controller,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WalletController controller = Get.find<WalletController>();

    return Obx(
      () => Switch(
        value: controller.isDarkMode.value,
        activeColor: const Color(0xff4BC76D),
        onChanged: (bool value) {
          controller.toggleTheme();
        },
      ),
    );
  }
}

class SwitchSavePayment extends StatelessWidget {
  final CreditCardController controller;

  const SwitchSavePayment({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Switch(
        value: controller.isPrimaryAddress.value,
        activeColor: const Color(0xff4BC76D),
        onChanged: (bool value) {
          controller.togglePrimaryAddress(value);
        },
      ),
    );
  }
}
