import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_app_drawer.dart';
import 'package:store_app/view/widgets/Home/body_content.dart';
import 'package:store_app/view/widgets/Home/seliver_app_bar_content.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImpl controller = Get.find<HomeControllerImpl>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: scaffoldKey,
      drawer: Drawer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Dimensions.getWidth(context) * .85,
        child: CustomAppDrawer(scaffoldKey: scaffoldKey),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SilverAppBarContent(
                controller: controller, scaffoldKey: scaffoldKey),
          ];
        },
        body: BodyContent(controller: controller),
      ),
    );
  }
}
