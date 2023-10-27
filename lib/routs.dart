import 'package:flutter/material.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/view/screens/Auth/forget%20password/Success_RestPassword.dart';
import 'package:store_app/view/screens/Auth/forget%20password/forget%20password.dart';
import 'package:store_app/view/screens/Auth/forget%20password/reset%20password.dart';
import 'package:store_app/view/screens/Auth/sign%20up.dart';
import 'package:store_app/view/screens/Auth/success_signUp.dart';
import 'package:store_app/view/screens/Auth/forget%20password/verifay%20code.dart';
import 'package:store_app/view/screens/Auth/vertifay%20code%20sign%20up.dart';
import 'package:store_app/view/screens/on%20boarding.dart';

import 'view/screens/Auth/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // Authentication
  AppRouts.login: (p0) => const Login(),
  AppRouts.signup: (p0) => const SignUp(),
  AppRouts.forgetPass: (p0) => const ForgetPassword(),
  AppRouts.resetPass: (p0) => const ResetPassword(),
  AppRouts.verifayCode: (p0) => const VerifayCode(),
  AppRouts.signUpSuccess: (p0) => const SignUpSuccess(),
  AppRouts.resetPasswordSuccess: (p0) => const ResetPasswordSuccess(),
  // on Bording
  AppRouts.onBording: (p0) => const OnBording(),
  AppRouts.signUpVerifayCode: (p0) => const SignUpVerifayCode(),
};
