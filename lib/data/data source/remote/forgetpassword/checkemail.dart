import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/crud.dart';

class CheckEmail {
  Crud crud;

  CheckEmail(this.crud);

  checkEmail(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
