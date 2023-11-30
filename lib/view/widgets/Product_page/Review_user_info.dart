import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ronald Richards',
          style:
              CustomStyle.textStyle15.copyWith(color: const Color(0xff1D1E20)),
        ),
        const Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              '13 Sep, 2023',
              style: CustomStyle.textStyle11,
            ),
          ],
        ),
      ],
    );
  }
}