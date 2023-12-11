class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";
  static const String usersData = "$server/test.php";
  //=========================== Image ==============================
// localhost/ecommerce/home.php
  //=========================== Auth ==============================

  static const String signUp = "$server/Auth/signup.php";
  static const String verifayCode = "$server/Auth/verifaycode.php";
  static const String login = "$server/Auth/login.php";

  //======================= Forget password ================

  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String forgetPassVerifaycode =
      "$server/forgetpassword/verifaycode.php";

  //======================= Home ================

  static const String homePage = "$server/home.php";
  static const String items = "$server/item/items.php";
}
