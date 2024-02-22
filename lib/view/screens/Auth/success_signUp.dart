import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/sign%20up%20success%20conteoller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SuccessSignUpControllerImpl>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(
            height: 150,
          ),
          Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: ColorConstant.primary,
          )),
          Text("37".tr, style: context.headlineLarge),
          Text("39".tr),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: GetBuilder<SuccessSignUpControllerImpl>(
                builder: (controller) {
                  return CustomButton(
                      buttonName: "31".tr,
                      onPressed: () => controller.goToLoginPage(),
                      backgroundColor: ColorConstant.primary,
                      width: double.infinity - 20,
                      height: 40);
                },
              )),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
