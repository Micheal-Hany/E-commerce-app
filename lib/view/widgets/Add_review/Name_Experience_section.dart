import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Add_review/Custom_text_form_filed.dart';

class NameAndExperienceInputSection extends StatelessWidget {
  const NameAndExperienceInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Name',
              style: CustomStyle.textStyle17
                  .copyWith(color: const Color(0xff1D1E20)),
            ),
          ],
        ),
        SizedBox(height: Dimensions.getHeight(context) * .02),
        CustomTextField(
          hintText: 'Type your name',
          isMultiline: true,
          keyboardType: TextInputType.text,
          onChanged: (text) {},
          controller: TextEditingController(),
        ),
        SizedBox(height: Dimensions.getHeight(context) * .02),
        Row(
          children: [
            Text(
              'How was your experience ?',
              style: CustomStyle.textStyle17
                  .copyWith(color: const Color(0xff1D1E20)),
            ),
          ],
        ),
        SizedBox(height: Dimensions.getHeight(context) * .02),
        SingleChildScrollView(
            child: CustomTextField(
                hintText: 'Describe your experience?',
                isMultiline: true,
                keyboardType: TextInputType.text,
                onChanged: (text) {},
                controller: TextEditingController())),
      ],
    );
  }
}
