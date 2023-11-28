import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/data/models/login_model.dart';

class LocalStorageService extends GetxService {
  static SharedPreferences? _sharedPreferences;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var scaffoldKey1 = GlobalKey<ScaffoldState>();

  LoginModel? get loginModel {
    final rawJson = _sharedPreferences?.getString(_Key.loginModel.toString());
    if (rawJson == null) {
      return null;
    }
    return LoginModel.fromJson(json.decode(rawJson));
  }

  set loginModel(LoginModel? value) {
    print(value);
    if (value != null) {
      final rawJson = json.encode(value.toJson());
      _sharedPreferences?.setString(_Key.loginModel.toString(), rawJson);
    } else {
      _sharedPreferences?.remove(_Key.loginModel.toString());
    }
  }

  String? get token {
    final rawJson = _sharedPreferences?.getString(_Key.token.toString());
    if (rawJson == null) {
      return null;
    }
    return rawJson;
  }

  set token(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.token.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.token.toString());
    }
  }

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static bool? getBool({required String key}) {
    if (kDebugMode) {
      print('getting bool ${_sharedPreferences?.getBool(key)}');
    }
    return _sharedPreferences?.getBool(
      key,
    );
  }

  static String? getString({required String key}) {
    return _sharedPreferences?.getString(
      key,
    );
  }

  static removeBool({required String key}) {
    _sharedPreferences?.remove(
      key,
    );
  }

  static removeString({required String key}) {
    _sharedPreferences?.remove(
      key,
    );
  }

  static setBool({required bool value, required String key}) {
    if (kDebugMode) {
      print('setting bool $value');
    }
    _sharedPreferences?.setBool(key, value);
  }

  ///shared Preference functions

  static setString({required String value, required String key}) {
    _sharedPreferences?.setString(key, value);
  }
}

enum _Key { token, loginModel }
