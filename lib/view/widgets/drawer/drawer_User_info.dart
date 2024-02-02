import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Product_page/avatar_image.dart';
import 'package:get/get.dart';

class CustomDrawerUserInfo extends StatelessWidget {
  const CustomDrawerUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HaomeScreenContollerImpl());
    return Row(
      children: [
        const UserAvatar(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<HaomeScreenContollerImpl>(
              builder: (controller) => Text(
                controller.name,
                style: CustomStyle.textStyle17,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Text(
                  "109".tr,
                  style: CustomStyle.textStyle13
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xff4AC76D),
                  size: 15,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
