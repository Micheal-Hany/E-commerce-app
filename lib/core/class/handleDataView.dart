import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/class/status%20request.dart';

class ViewDataHandleing extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;
  const ViewDataHandleing(
      {super.key, required this.widget, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : statusRequest == StatusRequest.failure
            ? const Center(
                child: Text('No Data'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text('Server Failure'),
                  )
                : statusRequest == StatusRequest.offlinefailure
                    ? const Center(
                        child: Text('Check Internet Connection'),
                      )
                    : widget;
  }
}
