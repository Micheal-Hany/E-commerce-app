class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";
  // server IP 
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
  static const String search = "$server/item/search.php";
  static const String makeOrder = "$server/order/make_orders.php";

  //======================= Review ================

  static const String getReview = "$server/reviews/get_reviews.php";
  static const String makeReview = "$server/reviews/make_review.php";
}
