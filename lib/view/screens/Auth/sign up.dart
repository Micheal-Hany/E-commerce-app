import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Auth/sign%20up%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/function/exit_alert.dart';
import 'package:store_app/view/widgets/Auth/SignUpContent.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<SignUpControllerImpl>();

    return Scaffold(
      body: GetBuilder<SignUpControllerImpl>(
        builder: (controller) {
          return ViewDataHandleingRequest(
            statusRequest: controller.stateRequest,
            widget: WillPopScope(
              onWillPop: exitAlert,
              child: SignUpContent(controller: controller),
            ),
          );
        },
      ),
    );
  }
}
