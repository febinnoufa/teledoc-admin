import 'package:flutter/material.dart';

class DoctorCountWidget extends StatelessWidget {
  const DoctorCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 111, 202, 120),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200, 
          width: 200,
          child: const Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "DOCTORS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 30,
              ),
              Text(
                "TOTAL    :           90",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "MALE     :           40",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "FEMALE :           50",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ],
          ), 
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            //  color: Color.fromARGB(255, 246, 247, 246),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          width: 100,
          child: Image.network(
            "https://media.istockphoto.com/id/147948536/photo/female-doctor-standing-with-arms-crossed-isolated.jpg?s=612x612&w=0&k=20&c=4RZPVLQUuBkP7qDwfpSwlJ8yTQNBqFPI94oJvHSZgvE=",
          ),
        ),
      ],
    );
  }
}


