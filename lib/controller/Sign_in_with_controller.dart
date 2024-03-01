import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:twitter_login/twitter_login.dart';

class SignInWithController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final TwitterLogin _twitterLogin = TwitterLogin(
    apiKey: 'your_twitter_api_key',
    apiSecretKey: 'your_twitter_api_secret',
    redirectURI: 'your_redirect_uri',
  );
  Future<void> signInWithGoogle() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // Handle if user cancels sign-in
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _signInWithCredential(credential);
      statusRequest = StatusRequest.success;
      update();
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      final LoginResult result = await _facebookAuth.login();
      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await _signInWithCredential(credential);
      statusRequest = StatusRequest.success;
      update();
    } catch (error) {
      print('Error signing in with Facebook: $error');
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      final TwitterLogin twitterLogin = TwitterLogin(
        apiKey: "4LKQrqcuQrUlhLCjAAFPDx5Ys",
        apiSecretKey: "GrtuBhOt586XIfHBBYs5zp52aBqiMUawHddZSVymy8XcALidaG",
        redirectURI: "flutter-twitter-login://",
      );

      final authResult = await twitterLogin.login();
      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final String token = authResult.authToken!;
        final String secret = authResult.authTokenSecret!;

        final AuthCredential credential = TwitterAuthProvider.credential(
          accessToken: token,
          secret: secret,
        );
        // Then use this credential to sign in with Firebase Authentication
        await FirebaseAuth.instance.signInWithCredential(credential);
        statusRequest = StatusRequest.success;
        update();
      } else {
        print('Failed to sign in with Twitter');
      }
    } catch (error) {
      print('Error signing in with Twitter: $error');
    }
  }

  void loginWithTwitter() async {
    statusRequest = StatusRequest.loading;
    update();

    final authResult = await _twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // Handle logged in state
        print('Successfully logged in to Twitter!');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // Handle user cancellation
        print('Twitter login cancelled by user.');
        break;
      case TwitterLoginStatus.error:
        // Handle login error
        print('Error logging in to Twitter: ${authResult.errorMessage}');
        break;
      case null:
      // TODO: Handle this case.
    }
    statusRequest = StatusRequest.success;
    update();
  }

  Future<void> _signInWithCredential(AuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      myServices.sharedPreferences.setString("step", "2");
      Get.offNamed(AppRouts.homePage);
    } catch (error) {
      print('Error signing in with credential: $error');
    }
  }

  // Example method to navigate to login screen
  void gotoLogin() {
    Get.toNamed(AppRouts.login);
  }

  // Example method to navigate to create account screen
  void goToCreateAccount() {
    Get.toNamed(AppRouts.signup);
  }
}
