import 'package:flutter/material.dart';
import 'package:store_app/core/function/responsive_app.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.getWidth(context) * .15,
      width: Dimensions.getWidth(context) * .15,
      child: Image.asset(
        'assets/images/avatar.png',
      ),
    );
  }
}
