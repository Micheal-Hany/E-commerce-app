import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/main.dart';

class CustomCategoryTitle extends StatelessWidget {
  const CustomCategoryTitle({
    super.key,
    required this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '56'.tr,
          style: context.bodySmall!.copyWith(fontSize: 18),
        ),
        InkWell(
            onTap: onTap,
            child: Text('57'.tr,
                style:
                    context.bodySmall?.copyWith(color: ColorConstant.manatee)))
      ],
    );
  }
}
