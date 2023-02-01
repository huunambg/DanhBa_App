// import 'screen1.dart';
// import 'package:flutter/material.dart';
// class Lichsu{
//   String? namels;
//   String? phonels;
//   Lichsu({this.namels, this.phonels});
// }


// class history extends StatelessWidget {
//   const history({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'App1 Demo',
//       home: screenyt(),
//     );
//   }
// }


// class LS extends StatefulWidget {
//   const LS({Key? key}) : super(key: key);

//   @override
//   State<LS> createState() => _LSState();
// }

// Lichsu _lichsu = Lichsu(namels: '', phonels: '');
// List<Lichsu> llichsu = [];

// class _LSState extends State<LS> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Lich sử cuộc gọi"),
//           backgroundColor: Colors.red,
//         ),
//         body: ListView(
//           children: [
//             Container(
//               child: Column(
//                 children: llichsu.map((e4) {
//                   return ListTile(
//                     title: Text("${e4.namels}"),
//                     subtitle: Text("${e4.phonels}"),
//                     onTap: (() {}),
//                     trailing: Icon(
//                       Icons.favorite,
//                       color: Colors.red,
//                     ),
//                   );
//                 }).toList(),
//               ),
//             )
//           ],
//         ));
//   }
// }
