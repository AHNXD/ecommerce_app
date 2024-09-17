import 'package:ecommerce_app_qr/Utils/enums.dart';

String? validation(String? text, ValidationState v) {
  switch (v) {
    case ValidationState.email:
      final emailRegex = RegExp(
          r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*");
      if (emailRegex.hasMatch(text!)) {
        return null; // Email is valid
      } else {
        return "Invalid email format"; // Or a more specific error message
      }

    case ValidationState.phoneNumber:
      final phoneRegex =
          RegExp(r'^(\+|\d{1,2})?\s?\(?\d{3}\)?[-\s]\d{3}-\d{4}$');
      if (phoneRegex.hasMatch(text!)) {
        return null; // Phone number is valid
      } else {
        return "Invalid phone number format."; // Or a more specific message
      }

    case ValidationState.normal:
      if (text!.isEmpty) {
        return "This field is required";
      } else {
        return null;
      }

    case ValidationState.password:
      if (text!.length < 8) {
        return "Password must be at least 8 characters long.";
      }

      // bool hasUppercase = text.contains(RegExp(r'[A-Z]'));
      // bool hasLowercase = text.contains(RegExp(r'[a-z]'));
      // bool hasDigit = text.contains(RegExp(r'[0-9]'));
      // bool hasSpecialCharacters =
      //     text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      // if (!hasUppercase) {
      //   return "Password must contain at least one uppercase letter.";
      // }
      // if (!hasLowercase) {
      //   return "Password must contain at least one lowercase letter.";
      // }
      // if (!hasDigit) {
      //   return "Password must contain at least one digit.";
      // }
      // if (!hasSpecialCharacters) {
      //   return "Password must contain at least one special character.";
      // }

      return null;

    default:
      return null;
  }
}
