import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/view/widgets/reviews_page/reviews_page_content.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.myTheme.scaffoldBackgroundColor,
      body: const ReviewPageContent(),
    );
  }
}
