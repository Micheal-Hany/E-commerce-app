import 'package:flutter/material.dart';

class CustomSettingLogo extends StatelessWidget {
  const CustomSettingLogo(
      {super.key,
      this.backgroundColor,
      required this.imageIcon,
      this.onPressed});
  final Color? backgroundColor;
  final Widget imageIcon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Dimensions.getWidth(context) * .08,
      // height: Dimensions.getHeight(context) * .04,
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(onPressed: onPressed, icon: imageIcon),
    );
  }
}
