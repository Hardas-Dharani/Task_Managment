import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management/data/models/login_model.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class SigninController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final signinFormKey = GlobalKey<FormState>();
  // Social Login
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  bool obsecurePass = true;
  final bool _passwordVisible = true;
  bool rememberMe = false;
  final String _email = '';

  final String _password = '';

  LoginModel loginModel = LoginModel();
  String get email => _email;
  String get password => _password;

  bool getPasswordVisiblity() {
    return _passwordVisible;
  }

  getRememberMe() {
    rememberMe =
        LocalStorageService.getBool(key: SharedPreferenceConstant.rememberMe) ??
            false;
    if (kDebugMode) {
      print('getting data');
    }
    if (kDebugMode) {
      print('getting data $rememberMe');
    }

    if (rememberMe) {
      emailTextEditingController.text = LocalStorageService.getString(
              key: SharedPreferenceConstant.rememberMeEmail) ??
          '';

      passwordTextEditingController.text = LocalStorageService.getString(
              key: SharedPreferenceConstant.rememberMePass) ??
          '';
    }
  }

  bool getRememberVisiblity() {
    return rememberMe;
  }

  @override
  void onClose() {
    focusEmail.removeListener(() {});
    focusPassword.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    getRememberMe();
    focusEmail.addListener(() {
      update();
    });
    focusPassword.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }

  removeRememberMe() {
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMeEmail);
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMePass);
  }

  saveRememberMe() {
    LocalStorageService.setString(
        value: emailTextEditingController.text,
        key: SharedPreferenceConstant.rememberMeEmail);
    LocalStorageService.setString(
        value: passwordTextEditingController.text,
        key: SharedPreferenceConstant.rememberMePass);
  }

  setObsecure() {
    obsecurePass = !obsecurePass;
    update();
  }

  setRememberVisiblity(bool visible) {
    rememberMe = visible;
    update();
  }

  Future<void> signIn({email, password}) async {
    try {
      LoadingDialog.show();
      final result =
          await AuthenticationRepositoryIml().signIn(email, password);

      if (result['token'] != null) {
        loginModel = LoginModel.fromJson(result);
        Get.find<LocalStorageService>().loginModel = loginModel;
        LoadingDialog.hide();
        if (loginModel.user!.roleId == 2) {
          Get.toNamed(Routes.teacherHome);
          // Get.toNamed(Routes.home);
        } else {
          Get.toNamed(Routes.home);
        }
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
  }

  Future<void> signInWithFacebook() async {
    // LoadingDialog.show();
    // try {
    //   final LoginResult result = await FacebookAuth.instance.login();
    //   if (result.accessToken != null) {
    //     final AccessToken accessToken = result.accessToken!;
    //     final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
    //     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    //     final User? user = userCredential.user;
    //     if (kDebugMode) {
    //       print('google login $user');
    //     }
    //     FacebookAuth.instance.logOut();
    //     LoadingDialog.hide();
    //     Get.find<LocalStorageService>().isPro == true ? Get.offNamed(Routes.bottomNavBarPro) : Get.offNamed(Routes.bottomNavBar);
    //   } else {
    //     LoadingDialog.hide();
    //     ToastComponent().showToast('User cancelled login');
    //   }
    // } catch (e) {
    //   LoadingDialog.hide();
    //   if (kDebugMode) {
    //     print('catch ${e.toString()}');
    //   }
    //   ToastComponent().showToast(e.toString());
    // }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      LoadingDialog.show();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        // final User? user = authResult.user;
        if (kDebugMode) {
          // print('google login $user');
        }
        _googleSignIn.signOut();
        LoadingDialog.hide();

        LoadingDialog.hide();
        ToastComponent().showToast('User cancelled login');
      }
    } catch (e) {
      LoadingDialog.hide();
      if (kDebugMode) {
        print('catch ${e.toString()}');
      }
      ToastComponent().showToast(e.toString());
    }
  }
}
