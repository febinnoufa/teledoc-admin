import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledocadmin/screens/auth/controller/validator_control.dart';
import 'package:teledocadmin/screens/auth/screens/login_screen.dart';
import 'package:teledocadmin/screens/home/widgets/bottomnav_widget.dart';

class AuthController extends GetxController {
  final LoginController loginController = Get.put(LoginController());

  validatadmin() async {
    if (loginController.usernameController.text == "admin" &&
        loginController.passwordController.text == "admin123") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Get.off(const BotomNavigationBar());
    } else {
      Get.snackbar("", "username and password is not correct");
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Get.off(() => const LoginScreen());
  }
}
