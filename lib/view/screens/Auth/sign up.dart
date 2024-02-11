import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/sign%20up%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/exit_alert.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/view/widgets/Auth/Custom%20Go%20To%20Register%20Page.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Auth/custom%20button%20Auth.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImpl());
    return Scaffold(body: GetBuilder<SignUpControllerImpl>(
      builder: (controller) {
        return ViewDataHandleingRequest(
          statusRequest: controller.stateRequest,
          widget: WillPopScope(
              onWillPop: exitAlert,
              child: GetBuilder<SignUpControllerImpl>(
                builder: (controller) {
                  if (controller.stateRequest == StatusRequest.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  CustomCartIcon(
                                      widget:
                                          const Icon(Icons.arrow_back_rounded),
                                      onPressed: () => Get.back(),
                                      backgroundColor: ColorConstant.manatee)
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextAuthTitle(title: '17'.tr),
                              const SizedBox(height: 18),
                              const SizedBox(height: 150),
                              CustomTextFormFiled(
                                validator: (val) =>
                                    inputValidtion(val!, 5, 15, "username"),
                                mrController: controller.userName,
                                iconData: Icons.person,
                                lableTitle: '20'.tr,
                              ),
                              const SizedBox(height: 30),
                              CustomTextFormFiled(
                                validator: (val) =>
                                    inputValidtion(val!, 5, 30, "email"),
                                mrController: controller.email,
                                iconData: Icons.email_outlined,
                                lableTitle: '18'.tr,
                              ),
                              const SizedBox(height: 30),
                              CustomTextFormFiled(
                                isNumber: true,
                                validator: (val) =>
                                    inputValidtion(val!, 10, 15, "phone"),
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
                                    validator: (val) =>
                                        inputValidtion(val!, 5, 20, "password"),
                                    mrController: controller.password,
                                    iconData: Icons.lock,
                                    lableTitle: '19'.tr,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // CustomButtonAuth(
                              //   onPressed: () => controller.signUp(),
                              //   title: '17'.tr,
                              // ),
                              CustomButton(
                                  buttonName: '17'.tr,
                                  onPressed: () => controller.signUp(),
                                  backgroundColor: ColorConstant.primary,
                                  width: double.infinity - 20,
                                  height: 40),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomGoToRegisterPageOrLogin(
                                textOne: '25'.tr,
                                textTwo: '26'.tr,
                                onTap: () => controller.goToSignIn(),
                              )
                            ],
                          ),
                        ));
                  }
                },
              )),
        );
      },
    ));
  }
}
