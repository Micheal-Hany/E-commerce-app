import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: CustomStyle.textStyle17.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
    required this.widget,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            const SizedBox(
              width: 5,
            ),
            Text(
              buttonName,
              style: CustomStyle.textStyle17.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
