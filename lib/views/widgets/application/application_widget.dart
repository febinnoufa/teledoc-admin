import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teledocadmin/controllers/applicaton/application_controller.dart';
import 'package:teledocadmin/views/widgets/application/card.dart';

class ApplicationWidget extends StatelessWidget {
  final BoxConstraints constraints;

  ApplicationWidget({super.key, required this.constraints});

  final ApplicationController cntrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('doctors').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No doctors found.'));
          }
          return snapshot.data!.docs.isEmpty
              ? const Center(
                  child: Text("No Applications"),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data!.docs[index];
                    var docid = snapshot.data!.docs[index].id;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.05,
                        vertical: constraints.maxHeight * 0.01,
                      ),
                      child: DoctorCard(
                        doc: doc,
                        docId: docid,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
