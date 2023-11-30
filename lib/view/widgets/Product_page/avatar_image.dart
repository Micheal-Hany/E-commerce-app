import 'package:flutter/material.dart';
import 'package:store_app/core/function/responsive_app.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.getWidth(context) * .15,
      width: Dimensions.getWidth(context) * .15,
      child: Image.network(
        'https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg',
      ),
    );
  }
}
