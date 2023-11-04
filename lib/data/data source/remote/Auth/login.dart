import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  login(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
