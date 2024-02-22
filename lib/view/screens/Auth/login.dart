import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Auth/login%20controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/constant/Custom_app_bar.dart';
import 'package:store_app/core/function/exit_alert.dart';
import 'package:store_app/view/widgets/login/forget_password_link.dart';
import 'package:store_app/view/widgets/login/login_button.dart';
import 'package:store_app/view/widgets/login/login_form.dart';
import 'package:store_app/view/widgets/login/popo.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl controller = Get.find<LoginControllerImpl>();

    return Scaffold(
      body: ViewDataHandleingRequest(
        statusRequest: controller.stateRequest,
        widget: WillPopScope(
          onWillPop: exitAlert,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * .05,
                  ),
                  const CustomAppBar(),
                  const LoginForm(),
                  const ForgotPasswordLink(),
                  SizedBox(
                    height: context.height * .05,
                  ),
                  const LoginButton(),
                  SizedBox(
                    height: context.height * .01,
                  ),
                  const GoToRegisterOrLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
