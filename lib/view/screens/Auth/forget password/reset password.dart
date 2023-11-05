import 'package:flutter/material.dart';
import 'package:store_app/controller/forgetpassword/reset%20password%20contreoller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Auth/custom%20button%20Auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl controller =
        Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgrounmfColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 17, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 35, 35, 35),
        ),
        title: Text(
          '35'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Form(
        key: controller.formState,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextAuthTitle(title: '34'.tr),
                const SizedBox(height: 18),
                //const CustomTextBodyAuth(bodyText: 'Make Your Password Strong'),
                const SizedBox(height: 50),
                CustomTextFormFiled(
                  // obscureText: true,
                  validator: (val) => inputValidtion(val!, 5, 20, "password"),
                  mrController: controller.password,
                  iconData: Icons.person,
                  lableTitle: '35'.tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormFiled(
                  validator: (val) => inputValidtion(val!, 5, 20, "password"),
                  mrController: controller.rePassword,
                  iconData: Icons.person,
                  lableTitle: '35'.tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonAuth(
                  onPressed: () => controller.goToSuccessResetPassword(),
                  title: '33'.tr,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
      ),
    );
  }
}
