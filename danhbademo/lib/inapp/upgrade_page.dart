import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../inapp/in_app.dart';
import '../../inapp/inapp_constants.dart';

class UpgradePage extends StatefulWidget {
  UpgradePage({
    Key? key,
    required this.itemName,
  }) : super(key: key);

  final String itemName;
  final inApp = Get.put(InApp());

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  @override
  void initState() {
    super.initState();
    widget.inApp.init();
  }

  @override
  void dispose() {
    widget.inApp.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = 1;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Mở Khóa Vip",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                widget.inApp.buySubscription(kSubId1);
              },
              child: Obx(() => Text("Buy ${widget.inApp.getPrice(kSubId1)}")),
            ),
            const SizedBox(height: 12),
            ...kConsumables.map((productId) {
              return PurchaseItem(
                name: "${widget.itemName} ${index++}",
                productId: productId,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class PurchaseItem extends StatelessWidget {
  const PurchaseItem({
    Key? key,
    required this.name,
    required this.productId,
  }) : super(key: key);

  final String name;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final InApp inApp = Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Obx(
            () => InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                inApp.buyConsumable(productId);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 80,
                      child: Image.asset(
                        "assets/images/vip_card.png",
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          inApp.getPrice(productId),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
