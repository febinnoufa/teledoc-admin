import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/auth/controller/auth_controller.dart';



class LoginForms extends StatelessWidget {
  LoginForms({Key? key});

  //final cntr = Get.put(Authcontroller());
   final cntr =Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "username",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          TextFormField(
            controller: cntr.usernamecontroller,
        //   controller: cntr.loginemailcontroller,
            decoration: InputDecoration(
              
                hintText: 'Enter username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  size: 20,
                )),
          ),
          const SizedBox(height: 30),
          // const Text(
          //   "PASSWORD",
          //   style: TextStyle(fontSize: 12,),
          // ),
          TextFormField(
            controller: cntr.passwordcontroller,
           // controller: cntr.loginpasswordcontroller,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
              prefixIcon: const Icon(
                Icons.lock,
                size: 20,
              ),
              hintText: 'Enter password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
         
          const SizedBox(height: 20),
          const SizedBox(height: 40,),

                 SizedBox(
            height: 50.0,
            child: SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () {
                  cntr.validatadmin();
             //     Get.offAll(const ApplicationSendMessageScreen());
              
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(
                      color: Colors.green, // Change border color here
                      width: 3.0, // Change border thickness here
                    ),
                  ),
                  minimumSize: const Size(100, 0), // Set minimum button size
                ),
                child: const Text("Login"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
