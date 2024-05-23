import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/auth/controller/auth_controller.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void validateFormAndLogin(AuthController authController) {
    if (formKey.currentState!.validate()) {
      authController.validatadmin();
    }
  }
}
