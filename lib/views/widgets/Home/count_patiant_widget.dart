import 'package:flutter/material.dart';

class PatiuntsCountWidget extends StatelessWidget {
  const PatiuntsCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "patient",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "TOTAL    :  23",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MALE     :  15",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "FEMALE :  08",
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
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: imageWidth,
              child: Image.network(
                "https://st2.depositphotos.com/1005435/6561/i/950/depositphotos_65615121-stock-photo-happy-man-isolated-full-body.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
