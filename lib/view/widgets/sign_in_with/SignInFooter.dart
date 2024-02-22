import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Sign_in_with_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
class SignInFooter extends StatelessWidget {
  final SignInWithController controller;

  const SignInFooter({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("142".tr, style: context.bodyLarge),
            InkWell(
              onTap: () => controller.gotoLogin(),
              child: Text(
                "143".tr,
                style: context.bodyLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        CustomButton(
          buttonName: "144".tr,
          onPressed: () => controller.goToCreateAccount(),
          backgroundColor: ColorConstant.primary,
          width: double.infinity - 20,
          height: 40,
        ),
      ],
    );
  }
}
