//  import 'package:flutter/material.dart';

// void _showModalBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: 200,
//           color: Colors.white,
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text('Bottom Sheet'),
//                 ElevatedButton(
//                   child: const Text('Close Bottom Sheet'),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//    showPersistentBottomSheet(BuildContext context) {
//     Scaffold.of(context).showBottomSheet<void>(
//       (BuildContext context) {
//         return Container(
//           height: 200,
//           color: Colors.greenAccent,
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Text('Persistent Bottom Sheet'),
//                 ElevatedButton(
//                   child: const Text('Close Bottom Sheet'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }