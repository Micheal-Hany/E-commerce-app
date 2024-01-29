
import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/drawer_controller.dart';
import 'package:store_app/view/widgets/drawer/drawer_item_data.dart';

class CsutomDrawerDatalistView extends StatelessWidget {
  const CsutomDrawerDatalistView({
    super.key, required this.controllaller,
  });
  final DrawerControllaller controllaller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controllaller.data.length,
      itemBuilder: (context, index) {
        var entry = controllaller.data.entries.elementAt(index);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomDrawerData(
            name: entry.value,
            widget: entry.key,
          ),
        );
      },
    );
  }
}
