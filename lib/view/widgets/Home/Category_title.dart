import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

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
          style: CustomStyle.textStyle17.copyWith(color: Colors.black),
        ),
        InkWell(
            onTap: onTap, child: Text('57'.tr, style: CustomStyle.textStyle13))
      ],
    );
  }
}
