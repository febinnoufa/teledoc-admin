import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/home/widgets/bottomnav_widget.dart';

class Authcontroller extends GetxController {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  validatadmin(){
    if (usernamecontroller.text == "adminteledoc" && passwordcontroller.text =="admin369") {
       
       Get.off(const BotomNavigationBar());
      
    }else{
      Get.snackbar("", "username and password is not correct");
    }
  }


}
