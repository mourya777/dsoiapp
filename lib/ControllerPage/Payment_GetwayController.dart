import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ---------------- Controller ----------------
class TransactionHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    // Dummy data for different categories
    transactions.value = [
      {
        "title": "Food",
        "amount": "- ₹500",
        "date": "12 Sept 2025",
        "details": {
          "orderId": "ORD1001",
          "category": "Pizza",
          "price": "₹500",
          "status": "Delivered",
        }
      },
      {
        "title": "Liquor",
        "amount": "- ₹800",
        "date": "11 Sept 2025",
        "details": {
          "orderId": "ORD1002",
          "category": "Whiskey",
          "price": "₹800",
          "status": "Pending",
        }
      },
      {
        "title": "Snack",
        "amount": "- ₹250",
        "date": "10 Sept 2025",
        "details": {
          "orderId": "ORD1003",
          "category": "Sandwich",
          "price": "₹250",
          "status": "Cancelled",
        }
      },
      {
        "title": "Fast Food",
        "amount": "- ₹350",
        "date": "09 Sept 2025",
        "details": {
          "orderId": "ORD1004",
          "category": "Burger",
          "price": "₹350",
          "status": "Delivered",
        }
      },
    ];
  }
}

