import 'package:get/get.dart';
import 'package:pomo/core/global/strings.dart';

class Validators {
  Validators._();

  static String? validateField(String? value) {
    if (value!.isEmpty) {
      return Strings.fieldRequired;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    // Vérifie la longueur du mot de passe
    if (password!.isEmpty) {
      return Strings.fieldRequired;
    } else if (password.length < 8) {
      return Strings.passwordLength;
    }

    // Retourne null si le mot de passe est valide
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return Strings.fieldRequired;
    }
    if (!GetUtils.isPhoneNumber(phoneNumber)) {
      return Strings.phoneNumberInvalid;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return Strings.fieldRequired;
    }
    if (!GetUtils.isEmail(email)) {
      return Strings.emailInvalid;
    }
    return null;
  }
}
