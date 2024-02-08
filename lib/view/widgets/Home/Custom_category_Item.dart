import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/main.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryName,
    required this.image,
    required TextStyle textStyle,
  });
  final String categoryName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.myTheme.cardColor,
          // color: Colors.green,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                // color: Colors.red,
                color: context.myTheme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              image,
              width: Dimensions.getHeight(context) * .04,
              height: Dimensions.getHeight(context) * .04,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //color: Colors.blue,
              color: context.myTheme.cardColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Tab(
              child: Center(
                child: Text(
                  categoryName,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
