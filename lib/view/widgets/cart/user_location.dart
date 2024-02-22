import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';

class UserLocationDetails extends StatelessWidget {
  const UserLocationDetails({
    Key? key,
    required this.country,
    required this.city,
  }) : super(key: key);

  final String country;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/images/location.jpeg"),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.getHeight(context) * .01),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    country,
                    style: context.bodySmall!.copyWith(fontSize: 15),
                  ),
                ),
                SizedBox(height: Dimensions.getHeight(context) * .01),
                Text(
                  city,
                  style: context.bodySmall!.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xff4AC76D),
          ),
        ],
      ),
    );
  }
}
