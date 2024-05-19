import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/auth/screens/login_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LoginScreen());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/TELE DOC(1).png")),
    );
  }
}
