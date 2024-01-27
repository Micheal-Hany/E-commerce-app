
import 'package:flutter/material.dart';
import 'package:store_app/controller/address_page_controller.dart';
import 'package:get/get.dart';
class SwitchExample extends StatelessWidget {
  final AddressPageController controller;

  const SwitchExample({
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
