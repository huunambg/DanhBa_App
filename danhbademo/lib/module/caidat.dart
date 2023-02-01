import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../inapp/upgrade_page.dart';

class CaiDat extends StatefulWidget {
  const CaiDat({Key? key}) : super(key: key);

  @override
  State<CaiDat> createState() => _CaiDatState();
}

class _CaiDatState extends State<CaiDat> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: Image.asset("assets/images/crown.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Mở khóa vip"),
          ElevatedButton(
              onPressed: () {
                Get.to(() => UpgradePage(itemName: "item"));
              },
              child: Text("Buy"))
        ],
      ),
    );
  }
}
