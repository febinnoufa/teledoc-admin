import 'package:flutter/material.dart';

class PatiuntsCountWidget extends StatelessWidget {
  const PatiuntsCountWidget({super.key});

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
                "TOTAL    :           743",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "MALE     :           340",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "FEMALE :           450",
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
            "https://st2.depositphotos.com/1005435/6561/i/950/depositphotos_65615121-stock-photo-happy-man-isolated-full-body.jpg",
          ),
        ),
      ],
    );
  }
}
