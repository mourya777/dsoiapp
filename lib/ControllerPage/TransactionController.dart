import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    // Static dummy transactions with details
    transactions.value = [
      {
        "title": "Food Court",
        "amount": "- ₹500",
        "date": "12 Sept 2025",
        "details": [
          {"item": "Pizza", "price": "₹200"},
          {"item": "Burger", "price": "₹150"},
          {"item": "Cold Drink", "price": "₹150"},
        ]
      },
      {
        "title": "Food Court",
        "amount": "- ₹300",
        "date": "11 Sept 2025",
        "details": [
          {"item": "Sandwich", "price": "₹120"},
          {"item": "Coffee", "price": "₹180"},
        ]
      },
      {
        "title": "Food Court",
        "amount": "- ₹450",
        "date": "10 Sept 2025",
        "details": [
          {"item": "Pasta", "price": "₹250"},
          {"item": "Juice", "price": "₹200"},
        ]
      },
      {
        "title": "Food Court",
        "amount": "- ₹250",
        "date": "09 Sept 2025",
        "details": [
          {"item": "Fries", "price": "₹100"},
          {"item": "Tea", "price": "₹150"},
        ]
      },
      {
        "title": "Food Court",
        "amount": "- ₹600",
        "date": "08 Sept 2025",
        "details": [
          {"item": "Thali", "price": "₹400"},
          {"item": "Cold Drink", "price": "₹200"},
        ]
      },
    ];
  }
}
