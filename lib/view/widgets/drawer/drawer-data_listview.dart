import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';
import 'package:store_app/view/widgets/drawer/CustomDrawerRow.dart';
import 'package:get/get.dart';

class CsutomDrawerDatalistView extends StatelessWidget {
  const CsutomDrawerDatalistView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HaomeScreenContollerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerRow(
              widget: Icon(Icons.sunny),
              labelKey: "107",
            ),
            SwitchExample(),
          ],
        ),
        DrawerRow(
            widget: const Icon(Icons.info_outline_rounded),
            labelKey: "102",
            onTap: () => controller.changePage(3)),
        DrawerRow(
            widget: const Icon(Icons.shopping_cart_checkout),
            // iconPath: "assets/images/Bag (1).png",
            labelKey: "103",
            onTap: () => controller.changePage(2)),
        DrawerRow(
            widget: const Icon(Icons.wallet_rounded),
            // iconPath: "assets/images/Wallet (1).png",
            labelKey: "104",
            onTap: () => Get.toNamed(AppRouts.viewAvailableCards)),
        DrawerRow(
            widget: const Icon(Icons.favorite_border_rounded),
            // iconPath: "assets/images/Heart (1).png",
            labelKey: "105",
            onTap: () => controller.changePage(1)),
        DrawerRow(
            widget: const Icon(Icons.settings),
            // iconPath: "assets/images/Setting.png",
            labelKey: "106",
            onTap: () => controller.changePage(3)),
      ],
    );
  }
}
