
import 'package:flutter/material.dart';
import 'package:store_app/core/function/responsive_app.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryName,
    required this.image,
  });
  final String categoryName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffF5F6FA),
          //color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                //color: Colors.red,
                color: const Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              image,
              width: Dimensions.getHeight(context) * .04,
              height: Dimensions.getHeight(context) * .04,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            // color: const Color(0xffF5F6FA),
            // child: widget,
            child: Tab(
              child: Text(
                categoryName,
              ),
            ),
          )
        ],
      ),
    );
  }
}
