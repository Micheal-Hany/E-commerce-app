import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class VerifayCode {
  Crud crud;

  VerifayCode(this.crud);

  verifay(String email, String verifycode) async {
    var response = await crud.postData(AppLink.forgetPassVerifaycode, {
      "email": email,
      "verifycode": verifycode,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
