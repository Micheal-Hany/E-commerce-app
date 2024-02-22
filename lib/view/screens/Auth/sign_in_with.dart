import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Sign_in_with_controller.dart';
import 'package:store_app/view/widgets/sign_in_with/SignInWithContent.dart';

class SignInWithPage extends StatelessWidget {
  const SignInWithPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SignInWithController>();
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(),
      child: Scaffold(
        body: SafeArea(
          child: SignInWithContent(),
        ),
      ),
    );
  }
}
