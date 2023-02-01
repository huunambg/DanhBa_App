import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:danhbademo/module/screen1.dart';
import 'package:danhbademo/module/add.dart';
import 'screen1.dart';

class Banphim extends StatelessWidget {
  const Banphim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: banphimm(),
    );
  }
}

class banphimm extends StatefulWidget {
  const banphimm({Key? key}) : super(key: key);

  @override
  State<banphimm> createState() => _banphimmState();
}

class _banphimmState extends State<banphimm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottombar()));
          },
          icon: Icon(Icons.keyboard_return_outlined),
        ),
        title: Text('Bàn Phím'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: n1controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
            onChanged: (value) {
              setState(() {
                n1 = value;
              });
            },
          ),
          SizedBox(height: 50),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Them2()));
                setState(() {
                  phoneController2.text = '$SDT';
                });
              },
              child: Text('Thêm vào danh bạ')),
          SizedBox(height: 10),
          ElevatedButton.icon(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber('${SDT}');
              },
              icon: Icon(Icons.call),
              label: Text('Gọi')),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '1';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('1'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '2';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('2'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '3';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('3'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '4';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('4'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '5';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('5'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '6';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('6'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '7';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('7'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '8';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('8'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '9';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('9'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '*';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('*'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '0';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('0'))),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text += '#';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('#'))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    color: Colors.red.shade200,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            n1controller.text = ' ';
                            SDT = n1controller.text;
                          });
                        },
                        child: Text('X'))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
