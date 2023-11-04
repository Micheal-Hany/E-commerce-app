import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/test_data_controller.dart';
import 'package:store_app/core/class/handleDataView.dart';


class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return ViewDataHandleing(
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${controller.data[index]['users_name']}'),
                    subtitle: Text('${controller.data[index]['users_email']}'),
                  );
                },
              ),
              statusRequest: controller.stateRequest);
        },
      ),
    );
  }
}
