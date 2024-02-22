
import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20form%20filed.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl controller = Get.find<LoginControllerImpl>();

    return Form(
      key: controller.formState,
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 30),
          CustomTextAuthTitle(title: '10'.tr),
          const SizedBox(height: 10),
          CustomTextBodyAuth(bodyText: '11'.tr),
          const SizedBox(height: 230),
          CustomTextFormFiled(
            validator: (val) => inputValidtion(val!, 5, 20, "email"),
            mrController: controller.email,
            iconData: Icons.email_outlined,
            lableTitle: '12'.tr,
          ),
          const SizedBox(height: 30),
          GetBuilder<LoginControllerImpl>(
            builder: (controller) {
              return CustomTextFormFiled(
                obscureText: controller.showPassword,
                onTap: () {
                  controller.showPass();
                },
                isNumber: false,
                validator: (val) => inputValidtion(val!, 5, 20, "password"),
                mrController: controller.password,
                iconData: Icons.remove_red_eye_outlined,
                lableTitle: '13'.tr,
              );
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
