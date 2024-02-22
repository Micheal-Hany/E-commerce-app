import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Auth/sign%20up%20controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
class SignUpContent extends StatelessWidget {
  final SignUpControllerImpl controller;

  const SignUpContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: controller.formState,
        child: ListView(
          children: [
            Row(
              children: [
                CustomCartIcon(
                  widget: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => Get.back(),
                  backgroundColor: ColorConstant.manatee,
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomTextAuthTitle(title: '17'.tr),
            const SizedBox(height: 18),
            const SizedBox(height: 150),
            CustomTextFormFiled(
              validator: (val) => inputValidtion(val!, 5, 15, "username"),
              mrController: controller.userName,
              iconData: Icons.person,
              lableTitle: '20'.tr,
            ),
            const SizedBox(height: 30),
            CustomTextFormFiled(
              validator: (val) => inputValidtion(val!, 5, 30, "email"),
              mrController: controller.email,
              iconData: Icons.email_outlined,
              lableTitle: '18'.tr,
            ),
            const SizedBox(height: 30),
            CustomTextFormFiled(
              isNumber: true,
              validator: (val) => inputValidtion(val!, 10, 15, "phone"),
              mrController: controller.phone,
              iconData: Icons.phone,
              lableTitle: '21'.tr,
            ),
            const SizedBox(height: 30),
            GetBuilder<SignUpControllerImpl>(
              builder: (controller) {
                return CustomTextFormFiled(
                  obscureText: controller.showPassword,
                  onTap: () {
                    controller.showPass();
                  },
                  isNumber: false,
                  validator: (val) => inputValidtion(val!, 5, 20, "password"),
                  mrController: controller.password,
                  iconData: Icons.lock,
                  lableTitle: '19'.tr,
                );
              },
            ),
            const SizedBox(height: 25),
            const SizedBox(height: 30),
            CustomButton(
              buttonName: '17'.tr,
              onPressed: () => controller.signUp(),
              backgroundColor: ColorConstant.primary,
              width: double.infinity - 20,
              height: 40,
            ),
            const SizedBox(height: 15),
            CustomGoToRegisterPageOrLogin(
              textOne: '25'.tr,
              textTwo: '26'.tr,
              onTap: () => controller.goToSignIn(),
            ),
          ],
        ),
      ),
    );
  }
}
