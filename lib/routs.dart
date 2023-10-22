import 'package:flutter/material.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/view/screens/on%20boarding.dart';

import 'view/screens/Auth/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRouts.login: (p0) => const Login(),
  AppRouts.onBording: (p0) => const OnBording()
};
