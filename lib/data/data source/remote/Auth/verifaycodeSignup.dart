import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class VerifayCodeSignUpData {
  Crud crud;

  VerifayCodeSignUpData(this.crud);

  verifayCode(
    String email,
    String verifayCode,
  ) async {
    var response = await crud.postData(AppLink.verifayCode, {
      "email": email,
      "verifycode": verifayCode,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
