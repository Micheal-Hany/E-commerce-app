
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:get/get.dart';
class OrderHistoryCard extends StatelessWidget {
  final WalletController controller;

  const OrderHistoryCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToOrdersPage(),
      child: Card(
        color: context.myTheme.cardColor,
        child: Row(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  '154'.tr,
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
