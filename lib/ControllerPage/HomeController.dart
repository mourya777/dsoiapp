import 'package:get/get.dart';

class HomeController extends GetxController {
  // 🔹 Profile Data
  var memberName = "Rahul Sharma".obs;
  var membershipNo = "12345".obs;
  var balance = "₹1500".obs;
  var memberType = "Main Member".obs;
  var location = "DOI JABALPUR".obs;
  var mobileNo = "9876543210".obs;

  // 🔹 Latest Transaction (for Food Card ExpansionTile)
  var recentTransactionTitle = "Food Court".obs;
  var recentTransactionAmount = "₹500".obs;
  var recentTransactionDate = "12 Sept 2025".obs;

  // 🔹 All Transactions with details
  var transactions = [
    {
      "title": "Food Court",
      "amount": "₹500",
      "date": "12 Sept 2025",
      "details": [
        {"item": "Pizza", "price": "₹200"},
        {"item": "Burger", "price": "₹150"},
        {"item": "Cold Drink", "price": "₹150"},
      ]
    },
    {
      "title": "Gym",
      "amount": "₹1200",
      "date": "11 Sept 2025",
      "details": [
        {"item": "Personal Training", "price": "₹800"},
        {"item": "Protein Shake", "price": "₹400"},
      ]
    },
    {
      "title": "Membership Renewal",
      "amount": "₹5000",
      "date": "05 Sept 2025",
      "details": [
        {"item": "Annual Fee", "price": "₹5000"},
      ]
    },
  ].obs;
}
