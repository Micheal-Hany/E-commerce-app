import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '59'.tr,
                style: CustomStyle.textStyle17
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: CustomStyle.textStyle15,
          )
        ],
      ),
    );
  }
}
