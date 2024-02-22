import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class SocialSignInButton extends StatelessWidget {
  final String imagePath;
  final String buttonTextKey;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const SocialSignInButton({
    required this.imagePath,
    required this.buttonTextKey,
    required this.onPressed,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSignInButton(
      widget: Image.asset(imagePath),
      buttonName: buttonTextKey.tr,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      width: double.infinity - 20,
      height: 50,
    );
  }
}
