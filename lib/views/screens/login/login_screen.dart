import 'package:flutter/material.dart';
import 'package:teledocadmin/views/widgets/login/login_forms.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: LoginForms(),
            ),
          
          ],
        ),
      ),
    );
  }
}
