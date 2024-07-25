import 'package:flutter/material.dart';
import 'package:teledocadmin/views/widgets/login/login_forms.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth *
                        0.3, // Adjusted padding based on screen width
                    vertical: 20,
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: LoginForms(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
