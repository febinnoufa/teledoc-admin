import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:teledocadmin/model/application/model.dart';

class ApplicationController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
   // ignore: prefer_typing_uninitialized_variables
  var docId;
  // ignore: prefer_typing_uninitialized_variables
  var uidData;
  // ignore: prefer_typing_uninitialized_variables
  var data;
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
 

  Future<void> approovdoctor() async {
    try {
      uidData = await createUserWithEmailAndPassword(
          emailcontroller.text, passwordcontroller.text);
      if (uidData != null) {
        await createDoctor();
        await sendEmail();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), duration: const Duration(seconds: 4));
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password cannot be empty.');
      }
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error creating user: $e');
      return null;
    }
  }

  Future<void> createDoctor() async {
    DoctorApplicationModel application = DoctorApplicationModel(
      id:uidData.user!.uid,
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
        .collection("approveddoctors")
        .doc(uidData.user!.uid)
        .set(application.toMap());
  }

  Future<void> deleteDoctor(String docId) async {
    await db.collection("doctors").doc(docId).delete();
  }

  Future<void> sendEmail() async {
    try {
      final smtpServer = gmail('teledoc00@gmail.com',
          'pixv bdfj wwlc zsky'); // Use environment variables for security
      final message = Message()
        ..from = const Address('teledoc00@gmail.com', 'Teledoc Admin')
        ..recipients.add(emailcontroller.text)
        ..subject = 'Doctor Account Approved'
        ..text =
            'Your account has been approved. Your password is: ${passwordcontroller.text}';

      final sendReport = await send(message, smtpServer);
      print(
          'Message sent: .................................................................................' +
              sendReport.toString());
    } catch (e) {
      print(
          'Error sending email: ..........................................................................$e');
    }
  }
}
