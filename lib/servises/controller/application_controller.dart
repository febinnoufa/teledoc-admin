import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledocadmin/servises/model/model.dart';
//import 'package:http/http.dart' as http;

class ApplicationController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  approovdoctor() async {
    try {
      createUserWithEmailAndPassword(
          emailcontroller.text, passwordcontroller.text);

      creatdoctor();
    } catch (e) {
      Get.snackbar("error", "$e", duration: const Duration(seconds: 4));
    }
  }

  void createUserWithEmailAndPassword(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password cannot be empty.');
      }
      // Call Firebase createUserWithEmailAndPassword method here
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User created successfully, proceed with your logic
    } catch (e) {
      print('Error creating user: $e');
      // Handle and display error to the user
      // You can use Get.snackbar or other methods for showing errors
    }
  }

  creatdoctor() async {
    DoctorApplicationModel application = DoctorApplicationModel(
      bio: data["bio"],
      email: emailcontroller.text.trim(),
      experience: data["experience"],
      licensenumber: data["licensenumber"],
      genter: data["genter"],
      name: data["name"],
      phonenumber: data["phonenumber"],
      place: data["place"],
      profile: data["profile"],
      experiencecirtificate: null,
      licenseimage: data["licenseimage"],
      specialist: data["specialist"],
      password: passwordcontroller.text.trim(),
    );
    await db
        .collection("approoveddoctors")
        .doc(auth.currentUser!.uid)
        .set(application.toMap());
  }


  // sendemail()async{
  //  final url =Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //  const serviseid="service_t9x60bm";
  //  const templateid="template_wuvik2g";
  //  const userid="";
   
  //  final response = await  http.post(url,
  //  headers: {'Content-Type':'application/json'},
  //  body: json.encode({
  //   "service_id":
  //  })
  //  )
  // }
}
