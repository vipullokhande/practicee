import 'package:flutter/material.dart';

mixin ValidatorMixin {
  String? emailValidator(String email) {
    if (email.isEmpty) {
      return "Email should not empty";
    } else if (!email.contains("@")) {
      return "Enter valid email";
    }
    return null;
  }

  String? passwordValidator(String password) {
    if (password.isEmpty) {
      return "Password should not be empty";
    } else if (password.length < 6) {
      return "Password must be atleast of 6 characters";
    }
    return null;
  }

  String? validEmpty(String value, String field) {
    if (value.isEmpty) {
      return "$field should not be empty";
    }
    return null;
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    );
  }
}
