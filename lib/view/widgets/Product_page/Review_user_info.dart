import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
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
          style: context.bodySmall!.copyWith(
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              '13 Sep, 2023',
              style: context.bodySmall!.copyWith(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
