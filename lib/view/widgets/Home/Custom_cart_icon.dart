import 'package:flutter/material.dart';
import 'package:store_app/core/function/responsive_app.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon(
      {Key? key,
      required this.widget,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);
  final Widget? widget;
  final void Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.getWidth(context) * .11,
      height: Dimensions.getHeight(context) * .051,
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Center(child: widget),
      ),
    );
  }
}
