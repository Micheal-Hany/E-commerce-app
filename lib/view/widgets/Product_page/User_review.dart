import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/Product_page/Review_content.dart';
import 'package:store_app/view/widgets/Product_page/User_review_info.dart';

class CustomUserReview extends StatelessWidget {
  const CustomUserReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          UserInformation(),
          SizedBox(height: 10),
          ReviewContent(),
        ],
      ),
    );
  }
}
