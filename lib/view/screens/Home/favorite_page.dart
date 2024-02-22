import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/view/widgets/favorite_page/favorite_page_content.dart';

class FavoraitePage extends StatelessWidget {
  const FavoraitePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteControllerImpl>();
    return const Scaffold(body: FavoritePageContent());
  }
}
