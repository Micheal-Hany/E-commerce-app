import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_bottom_navber_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteControllerImpl>();
    // Get.put(HaomeScreenContollerImpl());
    Get.find<HaomeScreenContollerImpl>();
    return GetBuilder<HaomeScreenContollerImpl>(
      builder: (haomeScreenContollerImpl) {
        return Scaffold(
          bottomNavigationBar: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .06,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    haomeScreenContollerImpl.screens.length,
                    (index) => IconBottomAppBar(
                      onTap: () {
                        haomeScreenContollerImpl.changePage(index);
                        controller.getLikedProducts();
                      },
                      widget: index != haomeScreenContollerImpl.currentPage
                          ? Image.asset(
                              haomeScreenContollerImpl.screenIcons[index],
                              width: 30,
                              height: 30,
                            )
                          : Text(
                              haomeScreenContollerImpl.getScreenname()[index],
                              style: CustomStyle.textStyle13
                                  .copyWith(color: const Color(0xff9775FA)),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: haomeScreenContollerImpl
              .screens[haomeScreenContollerImpl.currentPage],
        );
      },
    );
  }
}
