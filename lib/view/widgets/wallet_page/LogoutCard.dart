
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';
class LogoutCard extends StatelessWidget {
  final WalletController controller;

  const LogoutCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<HaomeScreenContollerImpl>().logOut(),
      child: Card(
        color: context.myTheme.cardColor,
        child: Row(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  "108".tr,
                  style: context.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
