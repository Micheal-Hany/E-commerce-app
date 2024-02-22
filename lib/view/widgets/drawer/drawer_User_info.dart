import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Product_page/avatar_image.dart';
import 'package:get/get.dart';

class CustomDrawerUserInfo extends StatelessWidget {
  const CustomDrawerUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HaomeScreenContollerImpl>();
    return Row(
      children: [
        const UserAvatar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.name.value.toString(),
                    style: context.bodyLargeW500,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    Text(
                      "109".tr,
                      style: context.bodySmall
                          ?.copyWith(color: ColorConstant.manatee),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xff4AC76D),
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.getWidth(context) * .15,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                '${controller.orderTrackController.orders.length} Orders',
                style: TextStyle(color: ColorConstant.manatee),
              ),
            )
          ],
        )
      ],
    );
  }
}
