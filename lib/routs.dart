
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/middleware/myMeddilewere.dart';
import 'package:store_app/view/screens/Auth/forget%20password/Success_RestPassword.dart';
import 'package:store_app/view/screens/Auth/forget%20password/forget%20password.dart';
import 'package:store_app/view/screens/Auth/forget%20password/reset%20password.dart';
import 'package:store_app/view/screens/Auth/sign%20up.dart';
import 'package:store_app/view/screens/Auth/success_signUp.dart';
import 'package:store_app/view/screens/Auth/forget%20password/verifay%20code.dart';
import 'package:store_app/view/screens/Auth/vertifay%20code%20sign%20up.dart';
import 'package:store_app/view/screens/language.dart';
import 'package:store_app/view/screens/on%20boarding.dart';

import 'view/screens/Auth/login.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRouts.login, page: () => const Login()),
  GetPage(name: AppRouts.signup, page: () => const SignUp()),
  GetPage(name: AppRouts.forgetPass, page: () => const ForgetPassword()),
  GetPage(name: AppRouts.resetPass, page: () => const ResetPassword()),
  GetPage(name: AppRouts.verifayCode, page: () => const VerifayCode()),
  GetPage(name: AppRouts.signUpSuccess, page: () => const SignUpSuccess()),
  GetPage(
      name: AppRouts.resetPasswordSuccess,
      page: () => const ResetPasswordSuccess()),
  GetPage(name: AppRouts.onBording, page: () => const OnBording()),
  GetPage(
      name: AppRouts.signUpVerifayCode, page: () => const SignUpVerifayCode()),
];


// Map<String, Widget Function(BuildContext)> routes = {
//   // Authentication
//   AppRouts.login: (p0) => const Login(),
//   AppRouts.signup: (p0) => const SignUp(),
//   AppRouts.forgetPass: (p0) => const ForgetPassword(),
//   AppRouts.resetPass: (p0) => const ResetPassword(),
//   AppRouts.verifayCode: (p0) => const VerifayCode(),
//   AppRouts.signUpSuccess: (p0) => const SignUpSuccess(),
//   AppRouts.resetPasswordSuccess: (p0) => const ResetPasswordSuccess(),
//   // on Bording
//   AppRouts.onBording: (p0) => const OnBording(),
//   AppRouts.signUpVerifayCode: (p0) => const SignUpVerifayCode(),
// };
