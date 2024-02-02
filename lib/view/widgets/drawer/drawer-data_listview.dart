import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/address_page_controller.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';
import 'package:store_app/view/widgets/drawer/CustomDrawerRow.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DrawerRow(
              iconPath: "assets/images/sun.png",
              labelKey: "107",
            ),
            SwitchExample(controller: AddressPageController()),
          ],
        ),
        DrawerRow(
            iconPath: "assets/images/Info Circle.png",
            labelKey: "102",
            onTap: () => controller.changePage(3)),
        DrawerRow(
            iconPath: "assets/images/Bag (1).png",
            labelKey: "103",
            onTap: () => controller.changePage(2)),
        DrawerRow(
            iconPath: "assets/images/Wallet (1).png",
            labelKey: "104",
            onTap: () => controller.changePage(3)),
        DrawerRow(
            iconPath: "assets/images/Heart (1).png",
            labelKey: "105",
            onTap: () => controller.changePage(1)),
        DrawerRow(
            iconPath: "assets/images/Setting.png",
            labelKey: "106",
            onTap: () => controller.changePage(3)),
      ],
    );
  }
}
