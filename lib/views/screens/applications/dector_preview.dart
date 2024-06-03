import 'package:flutter/material.dart';
import 'package:teledocadmin/views/widgets/application/approove_button.dart';
import 'package:teledocadmin/views/widgets/application/sertificate_button_widget.dart';

class ApplicationPreview extends StatelessWidget {
  const ApplicationPreview({super.key, required this.data});
  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "${data["name"]}",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage("${data["profile"]}")),
          ),
          const SizedBox(
            height: 50,
          ),
          // SizedBox(
          //     height: 300,
          //     width: double.infinity,
          //     child: Image.network(
          //       "${data["profile"]}",
          //       height: 300,
          //     )
          //     ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " specialist :  ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "  ${data["specialist"]}",
                style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Ensure alignment to the start for the Column
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " About :  ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ), // Add spacing between the label and the bio
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (data["bio"] as String).split('\n').map((line) {
                    return Text(
                      "$line  ${data["experience"]} experience",
                      style: const TextStyle(
                          fontSize: 17, fontStyle: FontStyle.italic),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                " Details   ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " Email :  ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "  ${data["email"]}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " Phone :  ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "  ${data["phonenumber"]}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " License Number :  ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "  ${data["licensenumber"]}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " Gender :  ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "  ${data["genter"]}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                " Place :  ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "  ${data["place"]}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              SirtficatButtonWidget(
                  data: data["licenseimage"], text: "License cirtificate"),
              const SizedBox(
                width: 15,
              ),
              SirtficatButtonWidget(
                  data: data["profile"], text: "experience cirtificate"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          const Center(child: ApplicationApproovButton()),

          // const SizedBox(
          //   height: 10,
          // ),
          // Text("${data["bio"]}")
        ],
      ),
    ));
  }
}
