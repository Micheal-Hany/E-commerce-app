import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';


class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  signUp(String name, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": name,
      "email": email,
      "password": password,
      "phone": phone,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
