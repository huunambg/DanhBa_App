import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import 'inapp_constants.dart';
import 'store.dart';

class InApp extends GetxController {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final RxList<String> _notFoundIds = <String>[].obs;
  final RxList<ProductDetails> _products = <ProductDetails>[].obs;
  final RxList<PurchaseDetails> _purchases = <PurchaseDetails>[].obs;

  final RxMap<String, List<String>> _consumables = <String, List<String>>{}.obs;
  final RxMap<String, bool> _nonConsumables = <String, bool>{}.obs;

  final RxBool _isAvailable = false.obs;

  final RxMap<String, ProductDetails> _mapProducts =
      <String, ProductDetails>{}.obs;

  List<String> get notFoundIds => _notFoundIds;
  List<ProductDetails> get products => _products;
  List<PurchaseDetails> get purchases => _purchases;
  Map<String, List<String>> get consumables => _consumables;
  bool get isAvailable => _isAvailable.value;
  Map<String, ProductDetails> get mapProducts => _mapProducts;
  Map<String, bool> get nonConsumables => _nonConsumables;

  set notFoundIds(List<String> value) => _notFoundIds.value = value;
  set products(List<ProductDetails> value) => _products.value = value;
  set purchases(List<PurchaseDetails> value) => _purchases.value = value;
  set consumables(Map<String, List<String>> value) =>
      _consumables.value = value;
  set isAvailable(bool value) => _isAvailable.value = value;

  Map<String, ProductDetails> _convertListProductsToMap() {
    Map<String, ProductDetails> result = {};
    for (ProductDetails productDetail in _products) {
      result[productDetail.id] = productDetail;
    }

    return result;
  }

  void init() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;

    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });

    // Ph???i ch??? (await) initStoreInfo xong th?? m???i g???i restorePreviousPurchases
    // ????? tr??nh tr?????ng h???p restorePreviousPurchases xong tr?????c => map _nonConsumables
    // c?? d??? li???u nh??ng sau ???? initStoreInfo l???i g??n map _nonConsumables = {} r???ng
    await initStoreInfo();

    // Th??? b??? restorePreviousPurchases xem sao :3
    // restorePreviousPurchases();
  }

  void cancel() {
    _subscription.cancel();
  }

  void deliverProduct(PurchaseDetails purchaseDetails) async {
    if (kConsumables.contains(purchaseDetails.productID)) {
      await Store.instance
          .doSave(purchaseDetails.productID, purchaseDetails.purchaseID!);

      _consumables.value = await Store.instance.getConsumables(kConsumables);
    } else {
      _purchases.add(purchaseDetails);
      _nonConsumables[purchaseDetails.productID] = true;
    }
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status != PurchaseStatus.pending) {
        if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          await _inAppPurchase.completePurchase(purchaseDetails);

          deliverProduct(purchaseDetails);
        }

        if (Platform.isAndroid) {
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);

            // verifyPreviousPurchases();
          }
        }
      } else if (purchaseDetails.status != PurchaseStatus.pending) {
        // Khi mua h??ng m?? m???ng kh??ng ???n ?????nh th?? s??? b??? l???i "You already own this item"
        // Khi mua h??ng d???ng consume th?? c?? 2 b?????c l?? mua h??ng
        // sau ???? d??ng (consume) m??n h??ng ????.
        // N???u v???a mua xong nh??ng r???t m???ng th?? tr???ng th??i m??n h??ng ???? s??? l?? pending
        // (ch??? ti??u th???) => Kh??ng th??? mua ???????c l???n n???a
        // D?? c?? ????? autoConsume = true th?? v???n b??? l???i
        // Do ???? fix l?? consume th??? c??ng nh???ng m??n h??ng pending
        if (Platform.isAndroid) {
          // Acquire the InAppPurchaseAndroidPlatformAddition instance.
          InAppPurchaseAndroidPlatformAddition androidAddition = InAppPurchase
              .instance
              .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
          // Consume an Android purchase.
          await androidAddition.consumePurchase(purchaseDetails);
        }
      } else if (purchaseDetails.status != PurchaseStatus.canceled) {}
    });
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();

    if (!isAvailable) {
      _isAvailable.value = isAvailable;
      _products.value = [];
      _purchases.value = [];
      _notFoundIds.value = [];
      _consumables.value = {};
      _nonConsumables.value = {};

      return;
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(kProductIds.toSet());

    if (productDetailResponse.error != null) {
      _isAvailable.value = isAvailable;
      _products.value = productDetailResponse.productDetails;
      _purchases.value = [];
      _notFoundIds.value = productDetailResponse.notFoundIDs;
      _consumables.value = {};
      _nonConsumables.value = {};

      return;
    }

    final consumables = await Store.instance.getConsumables(kConsumables);

    _isAvailable.value = isAvailable;
    _products.value = productDetailResponse.productDetails;
    _notFoundIds.value = productDetailResponse.notFoundIDs;
    _consumables.value = consumables;
    _mapProducts.value = _convertListProductsToMap();
  }

  void buyConsumable(String productId) {
    ProductDetails? productDetails = _mapProducts[productId];

    if (productDetails != null) {
      PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
      );

      _inAppPurchase.buyConsumable(
        purchaseParam: purchaseParam,
        autoConsume: true,
      );
    }
  }

  void buySubscription(String productId) {
    ProductDetails? productDetails = _mapProducts[productId];

    if (productDetails != null) {
      PurchaseParam purchaseParam = GooglePlayPurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
        changeSubscriptionParam: null,
      );

      _inAppPurchase.buyNonConsumable(
        purchaseParam: purchaseParam,
      );
    }
  }

  void buyNonConsumable(String productId) {
    ProductDetails? productDetails = _mapProducts[productId];

    if (productDetails != null) {
      PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
      );

      _inAppPurchase.buyNonConsumable(
        purchaseParam: purchaseParam,
      );
    }
  }

  String getPrice(String productId, {String notFoundPrice = "..."}) {
    return _mapProducts[productId]?.price ?? notFoundPrice;
  }

  int getConsumableCount(String productId, {int notFoundCount = 0}) {
    return _consumables[productId]?.length ?? notFoundCount;
  }

  void consumeLast(String productId) async {
    Store.instance.doConsumeLast(productId);

    _consumables.value = await Store.instance.getConsumables(kConsumables);
  }

  bool isProductAvailable(String productId) {
    return isAvailable && mapProducts[productId] != null;
  }

  // void restorePreviousPurchases() async {
  //   try {
  //     await _inAppPurchase.restorePurchases();

  //     for (var purchase in _purchases) {
  //       _nonConsumables[purchase.productID] = true;
  //     }
  //   } on InAppPurchaseException {
  //     // print("Error when restore purchase");
  //   }
  // }

  bool isNonConsumablePurchased(String productId) {
    return _nonConsumables[productId] ?? false;
  }
}
