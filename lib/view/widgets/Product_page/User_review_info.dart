import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/Product_page/Rating_info.dart';
import 'package:store_app/view/widgets/Product_page/Review_user_info.dart';
import 'package:store_app/view/widgets/Product_page/avatar_image.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        UserAvatar(),
        SizedBox(width: 10),
        UserInfo(),
        Spacer(),
        RatingInfo(),
      ],
    );
  }
}
