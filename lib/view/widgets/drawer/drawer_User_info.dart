
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Product_page/avatar_image.dart';

class CustomDrawerUserInfo extends StatelessWidget {
  const CustomDrawerUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mrh Raju",
              style: CustomStyle.textStyle17,
            ),
            const SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Text(
                  "Verified Profile",
                  style: CustomStyle.textStyle13
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xff4AC76D),
                  size: 15,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
