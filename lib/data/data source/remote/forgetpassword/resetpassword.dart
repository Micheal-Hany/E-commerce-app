import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class ResetPassword {
  Crud crud;

  ResetPassword(this.crud);

  resetPassword(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
