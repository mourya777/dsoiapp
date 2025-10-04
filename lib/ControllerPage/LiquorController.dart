import 'package:get/get.dart';
import '../ApiControllers/ProductApiController.dart';
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/GlobleList.dart';
class LiquorController extends GetxController {
  final String catId;
  LiquorController({required this.catId});

  var categories = <String>[].obs;
  var isLoading = true.obs;

  var liquorData = <String, List<Map<String, dynamic>>>{};
  var stockLevels = <String, int>{};
  var selectedTypeIndex = <String, int>{};
  var bogoOffers = <String, List<int>>{}.obs;

  var smallCount = <String, int>{}.obs;
  var largeCount = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getUserId();
    fetchLiquorProducts();
  }

  Future<void> getUserId() async {
    final user = await SessionManager.getUser();
    if (user != null) {
      for (int i = 0; i < GlobalCart.cartData.length; i++) {
        GlobalCart.cartData[i]["member_id"] = "${user.records.memberId}";
      }
      print("✅ Member ID set for all categories: ${user.records.memberId}");
    }
  }

  Future<void> fetchLiquorProducts() async {
    try {
      isLoading(true);
      final List<Product> response = await ProductService.fetchProducts(
        catId: catId,
      );
      print("Liquor API response length: ${response.length}");

      categories.clear();
      liquorData.clear();
      stockLevels.clear();
      selectedTypeIndex.clear();
      smallCount.clear();
      largeCount.clear();

      for (var product in response) {
        final type = product.prdType ?? "Unknown";
        if (!categories.contains(type)) {
          categories.add(type);
          liquorData[type] = [];
          stockLevels[type] = 0;
          selectedTypeIndex[type] = 0;
          smallCount[type] = 0;
          largeCount[type] = 0;
        }
        liquorData[type]!.add({
          "id": product.prdId,
          "prd_id": product.prdId,
          "name": product.prdName,
          "price": double.tryParse(product.prdPrice) ?? 0,
          "stock": int.tryParse(product.prdStock) ?? 0, // ✅ Stock information
          "image": "Assets/Liquor/liquors.jpeg",
        });
        stockLevels[type] =
            (stockLevels[type] ?? 0) + (int.tryParse(product.prdStock) ?? 0);
      }
    } catch (e) {
      print("❌ Error fetching liquor products: $e");
    } finally {
      isLoading(false);
    }
  }

  // ✅ NEW: Get stock for specific brand in category
  int getBrandStock(String cat, int index) {
    if (liquorData[cat] != null && index < liquorData[cat]!.length) {
      return liquorData[cat]![index]['stock'] ?? 0;
    }
    return 0;
  }

  Map<String, dynamic> getCurrentItem(String cat) {
    int index = selectedTypeIndex[cat] ?? 0;
    return liquorData[cat]?[index] ?? {};
  }

  int getSmall(String cat) => smallCount[cat] ?? 0;
  int getLarge(String cat) => largeCount[cat] ?? 0;

  void addItem(String cat) {
    int totalMl =
        ((smallCount[cat] ?? 0) * 30) + ((largeCount[cat] ?? 0) * 60) + 30;
    largeCount[cat] = totalMl ~/ 60;
    smallCount[cat] = (totalMl % 60) ~/ 30;
    _updateGlobalCart(cat);
  }

  void removeItem(String cat) {
    int totalMl =
        ((smallCount[cat] ?? 0) * 30) + ((largeCount[cat] ?? 0) * 60) - 30;
    if (totalMl < 0) totalMl = 0;
    largeCount[cat] = totalMl ~/ 60;
    smallCount[cat] = (totalMl % 60) ~/ 30;
    _updateGlobalCart(cat);
  }

  void _updateGlobalCart(String cat) {
    int smallQty = getSmall(cat);
    int largeQty = getLarge(cat);
    var item = getCurrentItem(cat);

    int cartIndex = 1;

    int totalQty = smallQty + (2 * largeQty);

    int existingIndex = GlobalCart.cartData[cartIndex]["order"]
        .indexWhere((orderItem) => orderItem["prd_id"] == item['prd_id']);

    if (smallQty == 0 && largeQty == 0) {
      if (existingIndex != -1) {
        GlobalCart.cartData[cartIndex]["order"].removeAt(existingIndex);
        print("🗑️ REMOVED liquor: ${item['name']}");
      }
    } else {
      Map<String, dynamic> orderItem = {
        "prd_id": item['prd_id'],
        "name": item['name'],
        "price": item['price'].toString(),
        "qty": totalQty.toString(),
        "small": smallQty.toString(),
        "large": largeQty.toString(),
        "type": "liquor",
      };

      if (existingIndex != -1) {
        GlobalCart.cartData[cartIndex]["order"][existingIndex] = orderItem;
        print("📝 UPDATED liquor: ${item['name']} prd_id:${item['prd_id']} price:${item['price']} qty:$totalQty (small:$smallQty + 2*large:$largeQty)");
      } else {
        GlobalCart.cartData[cartIndex]["order"].add(orderItem);
        print("✅ ADDED liquor: ${item['name']} prd_id:${item['prd_id']} price:${item['price']} qty:$totalQty (small:$smallQty + 2*large:$largeQty)");
      }
    }

    GlobalCart.debugCartStatus();
  }

  int getTotalPrice() {
    int total = 0;
    for (var cat in categories) {
      final item = getCurrentItem(cat);
      double price = item['price'] ?? 0;
      total +=
          ((smallCount[cat] ?? 0) + (largeCount[cat] ?? 0) * 2) * price.toInt();
    }
    return total;
  }
}// class LiquorController extends GetxController {
//   final String catId;
//   LiquorController({required this.catId});
//   // pass catId here
//
//   var categories = <String>[].obs;
//   var isLoading = true.obs;
//
//   var liquorData = <String, List<Map<String, dynamic>>>{};
//   var stockLevels = <String, int>{};
//   var selectedTypeIndex = <String, int>{};
//   var bogoOffers = <String, List<int>>{}.obs;
//
//   var smallCount = <String, int>{}.obs;
//   var largeCount = <String, int>{}.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getUserId();
//     fetchLiquorProducts();
//   }
//   Future<void> getUserId() async {
//     final user = await SessionManager.getUser();
//     if (user != null) {
//       print("User ID: ${user.records.memberId}");
//       GlobalCart.cartData[0]["member_id"] = "${user.records.memberId}";
//       print("member id this!${GlobalCart.cartData[0]["member_id"]}");
//
//     } else {
//       print("member id this!${GlobalCart.cartData[0]["member_id"]}");
//     }
//   }
//   Future<void> fetchLiquorProducts() async {
//     try {
//       isLoading(true);
//       final List<Product> response = await ProductService.fetchProducts(
//         catId: catId,
//       );
//       print("Liquor API response length: ${response.length}");
//
//       categories.clear();
//       liquorData.clear();
//       stockLevels.clear();
//       selectedTypeIndex.clear();
//       smallCount.clear();
//       largeCount.clear();
//
//       for (var product in response) {
//         final type = product.prdType ?? "Unknown";
//         if (!categories.contains(type)) {
//           categories.add(type);
//           liquorData[type] = [];
//           stockLevels[type] = 0;
//           selectedTypeIndex[type] = 0;
//           smallCount[type] = 0;
//           largeCount[type] = 0;
//         }
//         liquorData[type]!.add({
//           "id": product.prdId,
//           "name": product.prdName,
//           "price": double.tryParse(product.prdPrice) ?? 0,
//           "stock": int.tryParse(product.prdStock) ?? 0,
//           "image": "Assets/Non-Veg/Egg Curry.jpeg",
//         });
//         stockLevels[type] =
//             (stockLevels[type] ?? 0) + (int.tryParse(product.prdStock) ?? 0);
//       }
//     } catch (e) {
//       print("❌ Error fetching liquor products: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Map<String, dynamic> getCurrentItem(String cat) {
//     int index = selectedTypeIndex[cat] ?? 0;
//     return liquorData[cat]?[index] ?? {};
//   }
//
//   int getSmall(String cat) => smallCount[cat] ?? 0;
//   int getLarge(String cat) => largeCount[cat] ?? 0;
//
//   void addItem(String cat) {
//     int totalMl =
//         ((smallCount[cat] ?? 0) * 30) + ((largeCount[cat] ?? 0) * 60) + 30;
//     largeCount[cat] = totalMl ~/ 60;
//     smallCount[cat] = (totalMl % 60) ~/ 30;
//   }
//
//   void removeItem(String cat) {
//     int totalMl =
//         ((smallCount[cat] ?? 0) * 30) + ((largeCount[cat] ?? 0) * 60) - 30;
//     if (totalMl < 0) totalMl = 0;
//     largeCount[cat] = totalMl ~/ 60;
//     smallCount[cat] = (totalMl % 60) ~/ 30;
//   }
//
//   int getTotalPrice() {
//     int total = 0;
//     for (var cat in categories) {
//       final item = getCurrentItem(cat);
//       double price = item['price'] ?? 0;
//       total +=
//           ((smallCount[cat] ?? 0) + (largeCount[cat] ?? 0) * 2) * price.toInt();
//     }
//     return total;
//   }
// }
