import 'package:flutter/material.dart';
import 'package:store_app/controller/forgetpassword/verifay%20code%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/Auth/Custom%20text%20bodyAuth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/view/widgets/Auth/Custom%20textTile%20Auth.dart';

class VerifayCode extends StatelessWidget {
  const VerifayCode({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.find<VerifayCodeControllerImpl>();

    return Scaffold(
       
        body: GetBuilder<VerifayCodeControllerImpl>(
      builder: (controller) {
        controller.onInit();
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
                          controller.checkCode(verificationCode);
                        }),
                  ),
                ],
              )),
        );
      },
    ));
  }
}
