import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Category_title.dart';
import 'package:store_app/view/widgets/Home/Custom_app_bar.dart';
import 'package:store_app/view/widgets/Home/Custom_category_listview.dart';
import 'package:store_app/view/widgets/Home/Custom_product_stack.dart';
import 'package:store_app/view/widgets/Home/Custom_searsh_bar.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar(),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getWidth(context) * .03,
                ),
                child: CustomCategoryTitle(
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: Dimensions.getWidth(context) * .03,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: GetBuilder<HomeControllerImpl>(
                  builder: (controller) {
                    return const ViewDataHandleingRequest(
                      widget: CustomCategorylistView(),
                      statusRequest: StatusRequest.success,
                    );
                  },
                ),
              ),
              GetBuilder<HomeControllerImpl>(
                builder: (controller) {
                  return ViewDataHandleing(
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                      statusRequest: controller.stateRequest);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar() {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: const <Widget>[],
      expandedHeight: Dimensions.getHeight(context) * .25,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context) * .03),
        expandedTitleScale: 1.0,
        centerTitle: true,
        title: SizedBox(
            height: Dimensions.getWidth(context) * .12,
            child: const CustomSearchBar()),
        background: Column(children: [
          SizedBox(
            height: Dimensions.getHeight(context) * .05,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getWidth(context) * .02),
              child: const CustomAppBar()),
          SizedBox(
            height: Dimensions.getHeight(context) * .02,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.getWidth(context) * .04),
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: CustomStyle.textStyle28,
                      ),
                      Text(
                        'Welcome to Laza.',
                        style: CustomStyle.textStyle15,
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: Dimensions.getHeight(context) * .03,
          ),
        ]),
      ),
    );
  }
}
