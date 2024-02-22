import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/view_avalible_address_page.dart/CustomViewAvailableAddressAppbar.dart';
import 'package:store_app/view/widgets/view_avalible_address_page.dart/address_list.dart';

class ViewAvailableAddresses extends StatelessWidget {
  const ViewAvailableAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewAvailableAddressesController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CustomViewAvailableAddressAppbar(),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const AddressList(),
            CustomButton(
              buttonName: "118".tr,
              onPressed: () => controller.goToMap(),
              backgroundColor: const Color(0xff9775FA),
              width: double.infinity - 20,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
