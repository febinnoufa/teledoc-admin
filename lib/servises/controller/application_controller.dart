import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:teledocadmin/servises/model/model.dart';
//import 'package:http/http.dart' as http;

class ApplicationController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: prefer_typing_uninitialized_variables
  var docId;
  var uiddata;

  approovdoctor() async {
    try {
       uiddata=
      createUserWithEmailAndPassword(
          emailcontroller.text, passwordcontroller.text);
       //   print("###########${uiddata}");

      creatdoctor();
    } catch (e) {
      Get.snackbar("error", "$e", duration: const Duration(seconds: 4));
    }
  }

   createUserWithEmailAndPassword(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password cannot be empty.');
      }
      // Call Firebase createUserWithEmailAndPassword method here
     final iddata= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("::::::::::::::$iddata");
      return iddata;
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
        .doc(uiddata.user!.uid)
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

  //  emailsend()async{
  //   try {
  //     var userEmail ="teledoc00@gmail.com";
  //     var message=Message();
  //     message.subject="subject from flutter";
  //     message.text="Hey... send from flutter";
  //     message.from= Address(userEmail.toString());
  //     message.recipients.add(userEmail);
  //     var smtpServer =gmailSaslXoauth2(userEmail, "ktupvgeqontofkdr");
  //     send(message, smtpServer);
  //     print("email has bees sent seccessfully...................................................");

  //   } catch (e) {
  //     print("${e.toString()}..............................................");

  //   }
  //  }
  // sendeEmail()async{
  //   final Email email =Email(
  //     body: passwordcontroller.text,
  //     subject: "its your password",
  //     recipients: [emailcontroller.text],
  //     isHTML: false
  //   );
  //   await FlutterEmailSender.send(email);

  // }

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
