import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/view/widgets/wallet_page/CustomWalletPageAppBar.dart';
import 'package:store_app/view/widgets/wallet_page/LogoutCard.dart';
import 'package:store_app/view/widgets/wallet_page/OrderHistoryCard.dart';
import 'package:store_app/view/widgets/wallet_page/SwitchSettingCard.dart';
import 'package:store_app/view/widgets/wallet_page/SwitchThemeCard.dart';

class WalletPageContent extends StatelessWidget {
  const WalletPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.find<WalletController>();
    return Padding(
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
          SwitchSettingCard(controller: walletController),
          const SizedBox(
            height: 20,
          ),
          SwitchThemeCard(controller: walletController),
          const SizedBox(
            height: 20,
          ),
          OrderHistoryCard(controller: walletController),
          const SizedBox(
            height: 20,
          ),
          LogoutCard(controller: walletController),
        ],
      ),
    );
  }
}
