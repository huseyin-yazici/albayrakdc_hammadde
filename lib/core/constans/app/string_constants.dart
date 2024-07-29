import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();

  static const String appName = 'Albayrak DC Fabrika';

  /// for Login view
  static const String loginTitle = "Giriş yapınız";
  static const String loginButtonText = "GİRİŞ";
  static const String usernameTitle = "Kullanıcı Adı";
  static const String passwordTitle = "Parola";
  static const String usernameHint = 'İsim';
  static const String passwordHint = '···········';

  /// for Home view
  static const String homePage = 'Anasayfaya Hoşgeldiniz';

  /// for validators
  static const String requiredField = "Zorunlu alan";
  static const String makeSureCorrectUsername =
      "Please make sure you enter the correct Username.";
}
