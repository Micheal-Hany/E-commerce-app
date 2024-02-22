import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/Product_page/Rating_info.dart';
import 'package:store_app/view/widgets/Product_page/Review_user_info.dart';
import 'package:store_app/view/widgets/Product_page/avatar_image.dart';

class UserInformation extends StatelessWidget {
  const UserInformation(
      {super.key,
      required this.name,
      required this.time,
      required this.rating});
  final String name;
  final DateTime time;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(),
        const SizedBox(width: 10),
        UserInfo(name: name, time: time),
        const Spacer(),
        RatingInfo(rate: rating),
      ],
    );
  }
}
