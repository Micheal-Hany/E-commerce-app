import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/main.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    Key? key,
    required this.labelKey,
    this.onTap,
    required this.widget,
  }) : super(key: key);

  final Widget widget;
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
            widget,
            const SizedBox(width: 15),
            Text(labelKey.tr, style: context.bodySmall!.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
