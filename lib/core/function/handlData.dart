import 'package:store_app/core/class/status%20request.dart';

handleData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
