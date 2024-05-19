import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/screens/home/screens/doctor_pass.dart';

class ApplicationApproovButton extends StatelessWidget {
  const ApplicationApproovButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
                    onPressed: () {
                      Get.to( DoctorPasswordGenarate());
                      // Your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: const Color.fromARGB(
                          255, 0, 4, 7), // Background color
                      // ignore: deprecated_member_use
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        side: const BorderSide(
                            color: Colors.green,
                            width: 2), // Border color and width
                      ),
                    ),
                    child:  Text("APPROOV"),
                  );
  }
}