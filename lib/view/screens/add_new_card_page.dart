// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store_app/controller/Add_new_card_controller.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/new_card/Custom_new_card_app_bar.dart';
import 'package:store_app/view/widgets/new_card/card_type_listView.dart';
import 'package:store_app/view/widgets/new_card/new_card_data_setion.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewcardController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.getWidth(context) * .02,
       
        ),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomNewCardAppBar(),
              SizedBox(height: 25),
              CustomCardTypeListView(),
              SizedBox(height: 30),
              NewCardDataSection()
            ],
          ),
        ),
      ),
    );
  }
}
