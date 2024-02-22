import 'package:flutter/material.dart';
import 'package:store_app/controller/Auth/sign%20up%20controller.dart';
import 'package:store_app/controller/Auth/signup%20verifay%20code%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';

class SignUpVerifayCode extends StatelessWidget {
  const SignUpVerifayCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpVerifayCodeControllerImpl());
    final controller = Get.find<SignUpVerifayCodeControllerImpl>();

    controller.email = Get.find<SignUpControllerImpl>().email.text;
    return Scaffold(body: GetBuilder<SignUpVerifayCodeControllerImpl>(
      builder: (controller) {
        return ViewDataHandleingRequest(
          statusRequest: controller.stateRequest,
          widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextAuthTitle(title: '40'.tr),
                  const SizedBox(height: 18),
                  CustomTextBodyAuth(
                      bodyText: '${'40'.tr}\n"${controller.email}"'),
                  const SizedBox(height: 50),
                  Image.asset('assets/images/lock.png'),
                  Container(
                    child: OtpTextField(
                      borderRadius: BorderRadius.circular(15),
                      clearText: true,
                      fieldWidth: 50,
                      numberOfFields: 5,
                      borderColor: Colors.black,
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        controller.goToSuccessPage(verificationCode);
                      },
                    ),
                  ),
                ],
              )),
        );
      },
    ));
  }
}
