// import 'package:flutter/material.dart';
// import 'screen1.dart';

// class Favorites extends StatelessWidget {
//   const Favorites({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'App1 Demo',
//       home: screenyt(),
//     );
//   }
// }

// class yeuthich {
//   String? name22;
//   String? phone22;
//   yeuthich({this.name22, this.phone22});
// }

// class screenyt extends StatefulWidget {
//   const screenyt({Key? key}) : super(key: key);

//   @override
//   State<screenyt> createState() => _screenytState();
// }

// yeuthich _yeuthich = yeuthich(name22: '', phone22: '');
// List<yeuthich> yyeuthich = [];

// class _screenytState extends State<screenyt> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hihi"),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               setState(() {
//                 ttransaction.add(_transaction);
//                 _transaction = Transaction(name: '', phone: '');
//                 print("${_transaction.name}");
//                 nameController.text = '';
//                 phoneController.text = '';
//               });
//             },
//             icon: Icon(Icons.add),
//             label: Text("Them"),
//             style: ElevatedButton.styleFrom(
//               primary: Colors.orange,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => screen2()));
//             },
//             child: Text("next"),
//           )
//         ],
//       )),
//     );
//   }
// }

// class screen2 extends StatefulWidget {
//   const screen2({Key? key}) : super(key: key);

//   @override
//   State<screen2> createState() => _screen2State();
// }

// class _screen2State extends State<screen2> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("Man hinh 2"),
//           ),
//           body: ListView(
//             children: [
//               Container(
//                 child: Column(
//                   children: ttransaction.map((e) {
//                     return ListTile(
//                       title: Text("${e.name}"),
//                       subtitle: Text("${e.phone}"),
//                       onTap: (() {}),
//                     );
//                   }).toList(),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
