import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledocadmin/views/screens/login/login_screen.dart';
import 'package:teledocadmin/views/widgets/BottomNav/bottomnav_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool('isLoggedIn');

      if (isLoggedIn != null && isLoggedIn) {
        Get.off(() => const BotomNavigationBar());
      } else {
        Get.off(() => const LoginScreen());
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("asset/TELE DOC(1).png")),
    );
  }
}
