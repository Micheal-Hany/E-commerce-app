import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Add_review/Custom_text_form_filed.dart';
import 'package:store_app/view/widgets/address_page/labled_text_form.dart';
import 'package:get/get.dart';

class NameAndExperienceInputSection extends StatelessWidget {
  const NameAndExperienceInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
            hintText: "75".tr,
            label: "75".tr,
            controller: TextEditingController()),
        SizedBox(height: Dimensions.getHeight(context) * .02),
        LabeledTextField(
            hintText: "99".tr,
            label: "99".tr,
            controller: TextEditingController()),
        SizedBox(height: Dimensions.getHeight(context) * .02),
      ],
    );
  }
}
