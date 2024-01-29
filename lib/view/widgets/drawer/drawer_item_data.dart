import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class CustomDrawerData extends StatelessWidget {
  const CustomDrawerData({super.key, required this.name, required this.widget});
  final String name;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        widget,
        const SizedBox(
          width: 15,
        ),
        Text(
          name,
          style: CustomStyle.textStyle15.copyWith(
              fontWeight: FontWeight.w400, color: const Color(0xff1D1E20)),
        ),
      ],
    );
  }
}
