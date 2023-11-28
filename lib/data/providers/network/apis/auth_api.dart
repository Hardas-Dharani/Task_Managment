import 'dart:io';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? fullName;
  File? coverImage;
  File? profileImage;
  String? about;
  String? qId;
  String? uId;
  String? provider;
  String? qAnswer;
  String? username;
  String? password;
  String? otp;
  String? email;
  String? password2;
  String? phoneNumber;
  String? oldPassword;
  String? refreshToken;
  String? newPassword;
  String? confirmNewPassword;

  // String accessToken = Get.find<LocalStorageService>().getBearerToken();
  AuthAPI.forgetPassword(String email)
      : this._(type: AuthType.forgetPassword, email: email);
  AuthAPI.login(String username, String password)
      : this._(type: AuthType.login, password: password, username: username);
  AuthAPI.logout()
      : this._(
          type: AuthType.logout,
        );

  AuthAPI.register(String username, String password, String password2,
      String email, String phoneNumber)
      : this._(
            type: AuthType.register,
            password: password,
            username: username,
            password2: password2,
            email: email,
            phoneNumber: phoneNumber);

  AuthAPI.socialLogIn(
      String uId, String fullName, String email, String provider)
      : this._(
            type: AuthType.socialLogin,
            uId: uId,
            fullName: fullName,
            email: email,
            provider: provider);
  AuthAPI._({
    required this.type,
    this.password,
    this.coverImage,
    this.profileImage,
    this.username,
    this.email,
    this.qId,
    this.uId,
    this.provider,
    this.qAnswer,
    this.oldPassword,
    this.newPassword,
    this.confirmNewPassword,
    this.otp,
    this.password2,
    this.phoneNumber,
    this.refreshToken,
    this.fullName,
    this.about,
  });

  @override
  get body {
    switch (type) {
      case AuthType.login:
        return {"email": username, "password": password};
      case AuthType.socialLogin:
        return {
          "uid": uId,
          "email": email,
          "full_name": fullName,
          "provider": provider
        };
      case AuthType.logout:
        return {"refresh": refreshToken};

      case AuthType.forgetPassword:
        return {"email": email};
      case AuthType.register:
        return {
          "full_name": username,
          "email": email,
          "password": password,
          "confirm_password": password2,
          "phone_number": phoneNumber
        };

      default:
        return "";
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers {
    switch (type) {
      case AuthType.login:
        return {};
      case AuthType.socialLogin:
        return {};
      case AuthType.register:
        return {};
      case AuthType.forgetPassword:
        return {};

      default:
        return {'Authorization': 'Bearer '};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthType.login:
        return HTTPMethod.post;
      case AuthType.socialLogin:
        return HTTPMethod.post;
      case AuthType.register:
        return HTTPMethod.post;
      case AuthType.forgetPassword:
        return HTTPMethod.post;

      default:
        return HTTPMethod.memberFormMethod;
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return APIEndpoint.middlewareURl + APIEndpoint.login;
      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams => {};

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum AuthType {
  login,
  socialLogin,
  logout,
  register,
  forgetPassword,
}
