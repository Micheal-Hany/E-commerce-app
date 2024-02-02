import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    Key? key,
    required this.iconPath,
    required this.labelKey,
    this.onTap,
  }) : super(key: key);

  final String iconPath;
  final String labelKey;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(iconPath),
            const SizedBox(width: 15),
            Text(
              labelKey.tr,
              style: CustomStyle.textStyle15.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(0xff1D1E20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
