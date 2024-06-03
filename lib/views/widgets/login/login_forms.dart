import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/controllers/Auth/auth_controller.dart';

import 'package:teledocadmin/controllers/Auth/validator_control.dart';

class LoginForms extends StatelessWidget {
  LoginForms({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Form(
        key: loginController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Username",
                style: TextStyle(fontSize: 13),
              ),
            ),
            TextFormField(
              controller: loginController.usernameController,
              decoration: InputDecoration(
                hintText: 'Enter username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  size: 20,
                ),
              ),
              validator: loginController.validateUsername,
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: loginController.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 20,
                ),
                hintText: 'Enter password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              validator: loginController.validatePassword,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  loginController.validateFormAndLogin(authController);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green,
                      width: 3.0,
                    ),
                  ),
                  minimumSize: const Size(100, 0),
                ),
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
