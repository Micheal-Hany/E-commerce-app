import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/main.dart';
import 'package:store_app/view/widgets/Home/Category_title.dart';
import 'package:store_app/view/widgets/Home/Custom_app_bar.dart';
import 'package:store_app/view/widgets/Home/Custom_app_drawer.dart';
import 'package:store_app/view/widgets/Home/Custom_category_listview.dart';
import 'package:store_app/view/widgets/Home/Custom_product_stack.dart';
import 'package:store_app/view/widgets/Home/Custom_searsh_bar.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/drawer/Custom_search_data.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final HomeControllerImpl controller = Get.put(HomeControllerImpl());
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: Drawer(
//         backgroundColor: const Color(0xffFFFFFF),
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         width: 330,
//         child: CustomAppDrawer(scaffoldKey: scaffoldKey),
//       ),
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
//           return <Widget>[
//             createSilverAppBar(controller),
//           ];
//         },
//         body: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: Dimensions.getWidth(context) * .03,
//                 ),
//                 child: CustomCategoryTitle(
//                   onTap: () {},
//                 ),
//               ),
//               SizedBox(
//                 height: Dimensions.getWidth(context) * .03,
//               ),
//               SizedBox(
//                 height: 40,
//                 width: double.infinity,
//                 child: GetBuilder<HomeControllerImpl>(
//                   builder: (controller) {
//                     return const ViewDataHandleingRequest(
//                       widget: CustomCategorylistView(),
//                       statusRequest: StatusRequest.success,
//                     );
//                   },
//                 ),
//               ),
//               GetBuilder<HomeControllerImpl>(
//                 builder: (controller) {
//                   return !controller.isSearch
//                       ? ViewDataHandleing(
//                           widget: GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               childAspectRatio: .75,
//                               crossAxisCount: 2,
//                             ),
//                             itemCount: controller.products.length,
//                             itemBuilder: (context, index) {
//                               return Center(
//                                   child: CustomItemStack(
//                                 product: controller.products[index],
//                               ));
//                             },
//                           ),
//                           statusRequest: controller.stateRequest)
//                       : CustomSearchData(
//                           controller: controller,
//                           searchProducts: controller.searchProducts,
//                         );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   SliverAppBar createSilverAppBar(HomeControllerImpl controller) {
//     return SliverAppBar(
//       automaticallyImplyLeading: false,
//       scrolledUnderElevation: 0.0,
//       backgroundColor: Colors.white,
//       actions: const <Widget>[],
//       expandedHeight: Dimensions.getHeight(context) * .25,
//       floating: false,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         titlePadding: EdgeInsets.symmetric(
//             horizontal: Dimensions.getWidth(context) * .03),
//         expandedTitleScale: 1.0,
//         centerTitle: true,
//         title: SizedBox(
//             height: Dimensions.getWidth(context) * .12,
//             child: CustomSearchBar(
//               controller: controller,
//             )),
//         background: Column(children: [
//           SizedBox(
//             height: Dimensions.getHeight(context) * .05,
//           ),
//           Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Dimensions.getWidth(context) * .02),
//               child: CustomAppBar(
//                 scaffoldKey: scaffoldKey,
//               )),
//           SizedBox(
//             height: Dimensions.getHeight(context) * .02,
//           ),
//           Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Dimensions.getWidth(context) * .04),
//               child: Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '53'.tr,
//                         style: CustomStyle.textStyle28,
//                       ),
//                       Text(
//                         '54'.tr,
//                         style: CustomStyle.textStyle15,
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//           SizedBox(
//             height: Dimensions.getHeight(context) * .03,
//           ),
//         ]),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final HomeControllerImpl controller = Get.put(HomeControllerImpl());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _scaffoldKey,
      drawer: Drawer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 330,
        child: CustomAppDrawer(scaffoldKey: _scaffoldKey),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar(controller),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getWidth(context) * .03,
                ),
                child: CustomCategoryTitle(onTap: () {}),
              ),
              SizedBox(height: Dimensions.getWidth(context) * .03),
              const SizedBox(
                height: 40,
                width: double.infinity,
                child: ViewDataHandleingRequest(
                  widget: CustomCategorylistView(),
                  statusRequest: StatusRequest.success,
                ),
              ),
              const CustomProductCridView(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar(HomeControllerImpl controller) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: const <Widget>[],
      expandedHeight: Dimensions.getHeight(context) * .25,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
          horizontal: Dimensions.getWidth(context) * .03,
        ),
        expandedTitleScale: 1.0,
        centerTitle: true,
        title: SizedBox(
          height: Dimensions.getWidth(context) * .12,
          child: CustomSearchBar(controller: controller),
        ),
        background: Column(
          children: [
            SizedBox(height: Dimensions.getHeight(context) * .05),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getWidth(context) * .02,
              ),
              child: CustomAppBar(scaffoldKey: _scaffoldKey),
            ),
            SizedBox(height: Dimensions.getHeight(context) * .02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getWidth(context) * .04,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('53'.tr, style: context.headlineMedium),
                      Text('54'.tr,
                          style: context.bodyMedium
                              ?.copyWith(color: ColorConstant.manatee)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.getHeight(context) * .03),
          ],
        ),
      ),
    );
  }
}

class CustomProductCridView extends StatelessWidget {
  const CustomProductCridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        return !controller.isSearch
            ? ViewDataHandleing(
                widget: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .75,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CustomItemStack(
                        product: controller.products[index],
                      ),
                    );
                  },
                ),
                statusRequest: controller.stateRequest,
              )
            : CustomSearchData(
                controller: controller,
                searchProducts: controller.searchProducts,
              );
      },
    );
  }
}
