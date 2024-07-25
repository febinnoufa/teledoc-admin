import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorCountWidget extends StatefulWidget {
  const DoctorCountWidget({super.key});

  @override
  _DoctorCountWidgetState createState() => _DoctorCountWidgetState();
}

class _DoctorCountWidgetState extends State<DoctorCountWidget> {
  List<Map<String, dynamic>> doctors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchApprovedDoctors().then((data) {
      setState(() {
        doctors = data;
        isLoading = false;
      });
    });
  }

  Future<List<Map<String, dynamic>>> fetchApprovedDoctors() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('approveddoctors').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    int totalDoctors = doctors.length;
    int maleDoctors =
        doctors.where((doctor) => doctor['genter'] == 'Male').length;
    int femaleDoctors =
        doctors.where((doctor) => doctor['genter'] == 'Female').length;

    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.4;
        double imageWidth = constraints.maxWidth * 0.2;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 111, 202, 120),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: containerWidth,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Doctors",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "TOTAL    : $totalDoctors",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "MALE     : $maleDoctors",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "FEMALE : $femaleDoctors",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: imageWidth,
              child: Image.network(
                "https://media.istockphoto.com/id/147948536/photo/female-doctor-standing-with-arms-crossed-isolated.jpg?s=612x612&w=0&k=20&c=4RZPVLQUuBkP7qDwfpSwlJ8yTQNBqFPI94oJvHSZgvE=",
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
