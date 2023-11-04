import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:lottie/lottie.dart';

class ViewDataHandleing extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;
  const ViewDataHandleing(
      {super.key, required this.widget, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Lottie.asset('assets/lattio/loading.json')
        : statusRequest == StatusRequest.failure
            ? const Center(
                child: Text('No Data'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset('assets/lattio/server_failure.json'),
                  )
                : statusRequest == StatusRequest.offlinefailure
                    ? Center(
                        child: Lottie.asset('assets/lattio/failure.json'),
                      )
                    : widget;
  }
}
