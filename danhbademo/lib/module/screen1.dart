import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:danhbademo/module/add.dart';
import 'package:danhbademo/module/banphim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:ndialog/ndialog.dart';
import 'huongdan.dart';
import 'add.dart';
import 'caidat.dart';

int _currentIndex = 0;

class Bottombar extends StatelessWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danh Bạ',
      home: MyWidget3(),
    );
  }
}

final suatencontrolor = TextEditingController();
final suaphonecontrolor = TextEditingController();

class lV extends StatefulWidget {
  const lV({Key? key}) : super(key: key);

  @override
  State<lV> createState() => _lVState();
}

class _lVState extends State<lV> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ttransaction.length,
      itemBuilder: (context, index) {
        final e = ttransaction[index];
        return ListTile(
          title: Text("${e.name}"),
          tileColor: Colors.blue.shade200,
          subtitle: Text("${e.phone}"),
          // onTap: (() {}),
          leading: IconButton(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber('${e.phone}');
                setState(() {
                  _lichsu.namels = e.name;
                  _lichsu.phonels = e.phone;
                  _lichsu.TG = DateTime.now();
                  llichsu.add(_lichsu);
                  _lichsu = Lichsu(namels: 'Không Tên', phonels: '', TG: null);
                });
              },
              icon: Icon(
                Icons.call,
                size: 30,
              )),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_pin_outlined,
              size: 30,
            ),
          ),
          onLongPress: () {
            NDialog(
              dialogStyle: DialogStyle(
                  titleDivider: true,
                  backgroundColor: Color.fromARGB(255, 128, 234, 160),
                  borderRadius: BorderRadius.circular(20)),
              title: Text("Hi, Xin Chào Bạn"),
              content: Text(
                  "xin mời bạn chọn chức năng cho người liên lạc ${e.name} "),
              actions: <Widget>[
                FlatButton(
                    child: Text("Lưu vào yêu thích"),
                    onPressed: () {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          message:
                              "Đã thêm ${e.name} vào danh sách yêu thích (+_+)",
                        ),
                      );
                      setState(() {
                        _yeuthich.name22 = e.name;
                        _yeuthich.phone22 = e.phone;
                        yyeuthich.add(_yeuthich);
                        _yeuthich = yeuthich(name22: '', phone22: '');
                      });

                      Navigator.pop(context);
                    }),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        suatencontrolor.text = '${e.name}';
                        suaphonecontrolor.text = '${e.phone}';
                      });
                      Navigator.pop(context);
                      NDialog(
                        dialogStyle: DialogStyle(
                            titleDivider: true,
                            backgroundColor: Color.fromARGB(255, 234, 128, 209),
                            borderRadius: BorderRadius.circular(20)),
                        title: Text("Hi, Xin Chào Bạn"),
                        content: Text(
                            "Sửa thông tin liên lạc cho người liên lạc ${e.name} "),
                        actions: <Widget>[
                          Column(
                            children: [
                              TextField(
                                onChanged: ((value) {
                                  suatencontrolor.text = value;
                                }),
                                decoration: InputDecoration(
                                    label: Text('Tên'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: suatencontrolor,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextField(
                                onChanged: (value) {
                                  suaphonecontrolor.text = value;
                                },
                                decoration: InputDecoration(
                                    label: Text('phone'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: suaphonecontrolor,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      e.name = suatencontrolor.text;
                                      e.phone = suaphonecontrolor.text;
                                    });
                                    Navigator.pop(context);
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.success(
                                        message: "Sửa thành công (+_+)",
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.save_as),
                                  label: Text('Lưu'))
                            ],
                          )
                        ],
                      ).show(context);
                    },
                    child: Text('Sửa')),
                FlatButton(
                    child: Text("Xóa"),
                    onPressed: () {
                      setState(() {
                        ttransaction.removeAt(index);
                      });
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          message: "Đã xóa ${e.name} khỏi danh bạ (+_+)",
                        ),
                      );
                      Navigator.pop(context);
                    }),
              ],
            ).show(context);
          },
        );
      },
    );
  }
}

class Quaysonhanh extends StatefulWidget {
  const Quaysonhanh({Key? key}) : super(key: key);

  @override
  State<Quaysonhanh> createState() => _QuaysonhanhState();
}

class _QuaysonhanhState extends State<Quaysonhanh> {
  String nambt = ' ';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: n1controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          onChanged: (value) {
            setState(() {
              SDT = value;
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
            child: Text('$nambt')),
        SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () async {
            FlutterPhoneDirectCaller.callNumber('${SDT}');
            setState(() {
              _lichsu.namels = 'Không Tên';
              _lichsu.phonels = '$SDT';
              _lichsu.TG = DateTime.now();
              llichsu.add(_lichsu);
              _lichsu = Lichsu(namels: 'Không Tên', phonels: '', TG: null);
            });
          },
          icon: Icon(
            Icons.call,
            size: 30,
          ),
          label: Text('Gọi', style: TextStyle(fontSize: 20)),
        ),
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                          nambt = 'Thêm vào Danh Bạ';
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
                  height: 50,
                  child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          n1controller.text = ' ';
                          SDT = n1controller.text;
                          nambt = '  ';
                        });
                      },
                      child: Text('X'))),
            ),
          ],
        )
      ],
    );
  }
}

final tabs = [lV(), Quaysonhanh(), LS(), CaiDat()];

class MyWidget3 extends StatefulWidget {
  const MyWidget3({Key? key}) : super(key: key);

  @override
  State<MyWidget3> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget3> {
  String tt = 'Danh Bạ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("$tt"),
        actions: [
          TextButton.icon(
            label: Text("Tìm kiếm"),
            onPressed: () {
              showSearch(context: context, delegate: Customseach());
            },
            icon: Icon(Icons.search),
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Them1()));
              },
              icon: Icon(Icons.add),
              label: Text('Thêm'))
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
            if (_currentIndex == 0) {
              tt = 'Danh Bạ';
            } else if (_currentIndex == 1) {
              tt = 'Quay Số Nhanh';
            } else if (_currentIndex == 2) {
              tt = 'Lịch Sử';
            } else if (_currentIndex == 3) {
              tt = 'Update vip';
            }
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Trang chủ"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.phone),
            title: Text("Quay số nhanh"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.history),
            title: Text("Lịch sử"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.lock_outline_rounded),
            title: Text("Vip prenium"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.purple,
            //   ),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text("Liên Hệ"),
              accountEmail: Text("NongHuuNam2002@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "Hi",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              hoverColor: Colors.red,
              title: Text('Danh dách yêu thích'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorites()));
              },
              onLongPress: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              hoverColor: Colors.red,
              title: Text('Quay Số Nhanh'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => banphimm()));
              },
              onLongPress: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              hoverColor: Colors.red,
              title: Text('Hướng dẫn'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Huongdan()));
              },
              onLongPress: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              hoverColor: Colors.red,
              title: Text('Thoát'),
              onLongPress: () {
                Navigator.pop(context);
              },
              onTap: () {
                NDialog(
                  dialogStyle: DialogStyle(
                      titleDivider: true,
                      backgroundColor: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  title: Text("Hi, Xin Chào Bạn"),
                  content: Text("Bạn có chắc chắn thoát khỏi ứng dụng"),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("Thoát"),
                        onPressed: () {
                          SystemNavigator.pop();
                        }),
                    FlatButton(
                        child: Text("Ở lại"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ).show(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App1 Demo',
      home: screenyt(),
    );
  }
}

class yeuthich {
  String? name22;
  String? phone22;
  yeuthich({this.name22, this.phone22});
}

class screenyt extends StatefulWidget {
  const screenyt({Key? key}) : super(key: key);

  @override
  State<screenyt> createState() => _screenytState();
}

yeuthich _yeuthich = yeuthich(name22: '', phone22: '');
List<yeuthich> yyeuthich = [];

class _screenytState extends State<screenyt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Danh Sách Yêu Thích"),
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bottombar()));
            },
          ),
        ),
        body: ListView.builder(
          itemCount: yyeuthich.length,
          itemBuilder: ((context, index) {
            final e2 = yyeuthich[index];
            return ListTile(
              title: Text("${e2.name22}"),
              subtitle: Text("${e2.phone22}"),
              onLongPress: () {
                setState(() {
                  yyeuthich.removeAt(index);
                });
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    message:
                        "Đã xóa ${e2.name22} khỏi danh sách yêu thích (+_+)",
                  ),
                );
              },
              trailing: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            );
          }),
        ));
  }
}

class Lichsu {
  String? namels;
  String? phonels;
  DateTime? TG;
  Lichsu({this.namels, this.phonels, this.TG});
}

class LS extends StatefulWidget {
  const LS({Key? key}) : super(key: key);

  @override
  State<LS> createState() => _LSState();
}

Lichsu _lichsu = Lichsu(namels: '', phonels: '', TG: null);
List<Lichsu> llichsu = [];

class _LSState extends State<LS> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: llichsu.length,
      itemBuilder: ((context, index) {
        final e4 = llichsu[index];
        return ListTile(
          title: Text("${e4.namels}"),
          subtitle: Text("${e4.phonels}"),
          onLongPress: (() {
            setState(() {
              llichsu.removeAt(index);
            });

            showTopSnackBar(
              context,
              CustomSnackBar.success(
                message: "Đã xóa cuộc gọi  ${e4.namels} khỏi lịch sử (+_+)",
              ),
            );
          }),
          trailing: Text('${e4.TG}'),
        );
      }),
    );
  }
}

class Customseach extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.keyboard_return));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Transaction> hihiHehe = [];
    for (var item in ttransaction) {
      if (item.name.toString().toLowerCase().contains(query.toLowerCase())) {
        hihiHehe.add(item);
      }
    }

    return ListView.builder(
        itemCount: hihiHehe.length,
        itemBuilder: ((context, index) {
          final result = hihiHehe[index];
          return ListTile(
            title: Text("${result.name}"),
            subtitle: Text("${result.phone}"),
            leading: IconButton(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber('${result.phone}');
                _lichsu.namels = result.name;
                _lichsu.phonels = result.phone;
                _lichsu.TG = DateTime.now();
                llichsu.add(_lichsu);
                _lichsu = Lichsu(namels: 'Không Tên', phonels: '', TG: null);
              },
              icon: Icon(Icons.call),
            ),
            trailing: Icon(Icons.person_pin_outlined),
            onLongPress: () {
              showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                      "Đã thêm ${result.name} vào danh sách yêu thích (+_+)",
                ),
              );
              _yeuthich.name22 = result.name;
              _yeuthich.phone22 = result.phone;
              yyeuthich.add(_yeuthich);
              _yeuthich = yeuthich(name22: '', phone22: '');
            },
          );
        }));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
