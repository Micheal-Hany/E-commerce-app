import 'package:flutter/material.dart';
import 'package:store_app/controller/address_fildes_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomAddressAppBar extends StatelessWidget {
  const CustomAddressAppBar({
    super.key,
    required this.controller,
  });
  final AddressPageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () => controller.backTocartPage(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        SizedBox(
          width: Dimensions.getWidth(context) / 3.5,
        ),
        Text(
          "74".tr,
          style: CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
