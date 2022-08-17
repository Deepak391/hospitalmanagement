// import 'package:flutter/material.dart';



// class prescriptionCard extends StatelessWidget {
  

//   const prescriptionCard();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       child: ListView.builder(
//         itemCount: 2,
//         itemBuilder: (_, index) {
//           //Doctor doc = doctors[index];
//           return Padding(
//             padding: EdgeInsets.all(8),
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 color: Color(0xffffffff),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(12),
//                 child: ListTile(
//                   leading: Image.asset(doc.image),
//                   title: Text(
//                     doc.name,
//                     style: const TextStyle(
//                       color: Color(0xff1E1C61),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     doc.specialization,
//                     style: TextStyle(
//                       color: Color(0xff1E1C61).withOpacity(0.7),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
