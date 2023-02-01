import 'package:danhbademo/class/transaction.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'screen1.dart';

class Transaction {
  String? name;
  String? phone;
  Transaction({this.name, this.phone});
}

String? n1;
final n1controller = TextEditingController();
String? SDT;

final nameController = TextEditingController();
final phoneController = TextEditingController();
final phoneController2 = TextEditingController();

Transaction _transaction = Transaction(name: '', phone: '');
List<Transaction> ttransaction = [
  Transaction(name: 'Nong Van Duong', phone: '06598484848'),
  Transaction(name: 'Trần Đình Toản', phone: '0866759322'),
  Transaction(name: 'Nông Văn Vũ', phone: '0866759322'),
  Transaction(name: 'Dương Minh Đức', phone: '0835161457'),
  Transaction(name: 'Vũ Đức Đại', phone: '06598484848'),
  Transaction(name: 'Nguyễn Văn Dương', phone: '0866759322'),
  Transaction(name: 'Nông Văn Vũ', phone: '0866759322'),
  Transaction(name: 'Nông Văn Đức', phone: '0835161457'),
  Transaction(name: 'Nguyễn Thị Hải', phone: '06598484848'),
  Transaction(name: 'Hoàng Văn Mạnh', phone: '0835161457'),
  Transaction(name: 'Trần Quốc Toản', phone: '06598484848'),
  Transaction(name: 'Vũ Thế Lực', phone: '0866759322'),
  Transaction(name: 'Nguyễn Hải Dương', phone: '0866759322'),
  Transaction(name: 'Vũ Quốc Cường', phone: '0835161457'),
  Transaction(name: 'Lâm Đăng Khoa', phone: '06598484848'),
];

class Them1 extends StatefulWidget {
  const Them1({Key? key}) : super(key: key);

  @override
  State<Them1> createState() => them1sate();
}

class them1sate extends State<Them1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Thêm Liên Lạc"),
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottombar()));
              },
              icon: Icon(Icons.keyboard_return))),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            onChanged: (newname) {
              setState(() {
                _transaction.name = newname;
              });
            },
            decoration: InputDecoration(
                labelText: "Nhap Ten",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: phoneController,
            onChanged: (newphone) {
              setState(() {
                _transaction.phone = newphone;
              });
            },
            decoration: InputDecoration(
                labelText: "Nhap SDT",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                      "Thêm ${_transaction.name} vào danh bạ thành công (+_+)",
                ),
              );
              setState(() {
                ttransaction.add(_transaction);
                _transaction = Transaction(name: 'Không Tên', phone: '');
                print("${_transaction.name}");
                nameController.text = '';
                phoneController.text = '';
              });
            },
            icon: Icon(Icons.add),
            label: Text("Them"),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
          )
        ],
      )),
    );
  }
}

class Them2 extends StatefulWidget {
  const Them2({Key? key}) : super(key: key);

  @override
  State<Them2> createState() => _them2state();
}

class _them2state extends State<Them2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Thêm Liên Lạc"),
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottombar()));
              },
              icon: Icon(Icons.keyboard_return))),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            onChanged: (newname) {
              setState(() {
                _transaction.name = newname;
              });
            },
            decoration: InputDecoration(
                labelText: "Nhap Ten",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: phoneController2,
            onChanged: ((value) {
              phoneController2.text = value;
            }),
            decoration: InputDecoration(
                labelText: "Nhap SDT",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                      "Thêm ${_transaction.name} vào danh bạ thành công (+_+)",
                ),
              );
              setState(() {
                _transaction.phone = phoneController2.text;
                ttransaction.add(_transaction);
                _transaction = Transaction(name: '', phone: '');
                nameController.text = '';
                phoneController2.text = '';
              });
              Navigator.pop(context);
            },
            icon: Icon(Icons.add),
            label: Text("Them"),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
          )
        ],
      )),
    );
  }
}
