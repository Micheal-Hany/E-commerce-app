import 'package:flutter/material.dart';
import 'package:store_app/controller/forgetpassword/reset%20password%20contreoller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ResetPasswordControllerImpl());
    Get.find<ResetPasswordControllerImpl>();
    

    return Scaffold(body: GetBuilder<ResetPasswordControllerImpl>(
      builder: (controller) {
        controller.onInit();
        controller.email=Get.arguments['email'];
        return ViewDataHandleing(
          statusRequest: controller.stateRequest,
          widget: Form(
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

                    const SizedBox(
                      height: 30,
                    ),

                    FancyPasswordField(
                      controller: controller.password,
                      validationRules: {
                        DigitValidationRule(),
                        UppercaseValidationRule(),
                        LowercaseValidationRule(),
                        SpecialCharacterValidationRule(),
                        MinCharactersValidationRule(6),
                        MaxCharactersValidationRule(12),
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                        buttonName: "33".tr,
                        onPressed: () async {
                          controller.goToSuccessResetPassword(
                              controller.password.text);
                        },
                        backgroundColor: ColorConstant.primary,
                        width: double.infinity - 20,
                        height: 40),
                  ],
                )),
          ),
        );
      },
    ));
  }
}
