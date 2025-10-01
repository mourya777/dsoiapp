import 'package:get/get.dart';

// class OrderHistoryController extends GetxController {
//   var transactions = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadTransactions();
//   }
//
//   void loadTransactions() {
//     transactions.value = [
//       {
//         "title": "OrdersHistory",
//         "amount": "- ₹500/-",
//         "date": "12 Sept 2025",
//         "details": {
//           "orderId": "ORD12345",
//           "category": "Food",
//           "price": "₹500/-",
//           "status": "Delivered",
//         }
//       },
//       {
//         "title": "OrdersHistory",
//         "amount": "- ₹300/-",
//         "date": "11 Sept 2025",
//         "details": {
//           "orderId": "ORD12346",
//           "category": "Liquor",
//           "price": "₹300/-",
//           "status": "Pending",
//         }
//       },
//       {
//         "title": "OrdersHistory",
//         "amount": "- ₹450/-",
//         "date": "10 Sept 2025",
//         "details": {
//           "orderId": "ORD12347",
//           "category": "FastFood",
//           "price": "₹450/-",
//           "status": "Cancelled",
//         }
//       },
//       {
//         "title": "OrdersHistory",
//         "amount": "- ₹250/-",
//         "date": "09 Sept 2025",
//         "details": {
//           "orderId": "ORD12348",
//           "category": "Snack",
//           "price": "₹250/-",
//           "status": "Delivered",
//         }
//       },
//       {
//         "title": "OrdersHistory",
//         "amount": "- ₹600/-",
//         "date": "08 Sept 2025",
//         "details": {
//           "orderId": "ORD12349",
//           "category": "Drink",
//           "price": "₹600/-",
//           "status": "Pending",
//         }
//       },
//     ];
//   }
// }
class OrderHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var searchDate = "".obs; // For date search

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    transactions.value = [
      {
        "title": "OrdersHistory",
        "amount": "- ₹500/-",
        "date": "12 Sept 2025",
        "details": [
          {"item": "Pizza", "price": "₹200"},
          {"item": "Burger", "price": "₹150"},
          {"item": "Cold Drink", "price": "₹150"},
        ],
        "status": "Delivered",
      },
      {
        "title": "OrdersHistory",
        "amount": "- ₹300/-",
        "date": "11 Sept 2025",
        "details": [
          {"item": "Wine", "price": "₹300"},
        ],
        "status": "Pending",
      },
      {
        "title": "OrdersHistory",
        "amount": "- ₹450/-",
        "date": "10 Sept 2025",
        "details": [
          {"item": "Burger", "price": "₹450"},
        ],
        "status": "Cancelled",
      },
      {
        "title": "OrdersHistory",
        "amount": "- ₹250/-",
        "date": "09 Sept 2025",
        "details": [
          {"item": "Sandwich", "price": "₹250"},
        ],
        "status": "Delivered",
      },
      {
        "title": "OrdersHistory",
        "amount": "- ₹600/-",
        "date": "08 Sept 2025",
        "details": [
          {"item": "Cold Drink", "price": "₹600"},
        ],
        "status": "Pending",
      },
    ];
  }

  List<Map<String, dynamic>> get filteredTransactions {
    if (searchDate.value.isEmpty) {
      return transactions;
    }
    return transactions
        .where((tx) =>
        tx["date"].toString().toLowerCase().contains(searchDate.value.toLowerCase()))
        .toList();
  }
}
