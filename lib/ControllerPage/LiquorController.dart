import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LiquorController extends GetxController {
  final RxList<String> categories =
      <String>["Whisky", "Rum", "Vodka", "Brandy", "Gin"].obs;

  final Map<String, List<Map<String, dynamic>>> liquorData = {
    "Whisky": [
      {"name": "Royal Stag", "price": 150, "image": "Assets/Liquor/Royal Stag.jpeg"},
      {"name": "McDowell’s No.1", "price": 200, "image": "Assets/Liquor/McDowell’s No.1.jpeg"},
      {"name": "Signature", "price": 300, "image": "Assets/Liquor/Signature.jpeg"},
      {"name": "Blenders Pride", "price": 250, "image": "Assets/Liquor/Blenders Pride.jpeg"},
      {"name": "8PM", "price": 180, "image": "Assets/Liquor/8PM.jpeg"},
    ],
    "Rum": [
      {"name": "Old Monk", "price": 160, "image": "Assets/Liquor/Old Monk .jpeg"},
      {"name": "Bacardi", "price": 220, "image": "Assets/Liquor/Bacardi .jpeg"},
      {"name": "Captain Morgan", "price": 280, "image": "Assets/Liquor/Captain Morgan .jpeg"},
      {"name": "Havana Club", "price": 300, "image": "Assets/Liquor/Havana Club .jpeg"},
      {"name": "McDowell’s No.1 Rum", "price": 180, "image": "Assets/Liquor/McDowell’s No.1 Rum .jpeg"},
    ],
    "Vodka": [
      {"name": "Smirnoff", "price": 1200, "image": "Assets/Liquor/Smirnoff.jpeg"},
      {"name": "Romanov", "price": 1180, "image": "Assets/Liquor/Romanov .jpeg"},
      {"name": "Absolut", "price": 1300, "image": "Assets/Liquor/Absolut .jpeg"},
      {"name": "Magic Moments", "price": 1220, "image": "Assets/Liquor/Magic Moments .jpeg"},
      {"name": "White Mischief", "price": 1150, "image": "Assets/Liquor/White Mischief.jpeg"},
    ],
    "Brandy": [
      {"name": "Old Admiral", "price": 1180, "image": "Assets/Liquor/Old Admiral .jpeg"},
      {"name": "Mansion House", "price": 1220, "image": "Assets/Liquor/Mansion House .jpeg"},
      {"name": "Contessa", "price": 1250, "image": "Assets/Liquor/Contessa.jpeg"},
      {"name": "Honey Bee", "price": 1200, "image": "Assets/Liquor/HoneyBee.jpeg"},
      {"name": "Bacardi Brandy", "price": 1280, "image": "Assets/Liquor/Bacardi Brandy .jpeg"},
    ],
    "Gin": [
      {"name": "Blue Riband", "price": 1180, "image": "Assets/Liquor/Blue Riband.jpeg"},
      {"name": "Greater Than", "price": 1250, "image": "Assets/Liquor/Greater Than .jpeg"},
      {"name": "Bombay Sapphire", "price": 1300, "image": "Assets/Liquor/Bombay Sapphire.jpeg"},
      {"name": "Hapusa", "price": 1220, "image": "Assets/Liquor/Hapusa .jpeg"},
      {"name": "Tanqueray", "price": 1350, "image": "Assets/Liquor/Tanqueray .jpeg"},
    ],
  };

  final Map<String, int> stockLevels = {
    "Whisky": 150,
    "Rum": 120,
    "Vodka": 80,
    "Brandy": 50,
    "Gin": 5,
  };

  final Map<String, List<int>> bogoOffers = {
    "Whisky": [0, 1, 2],
    "Rum": [0, 1, 2],
    "Vodka": [0, 1, 2],
    "Brandy": [0, 1, 2],
    "Gin": [0, 1, 2],
  };

  var selectedTypeIndex = <String, int>{}.obs;
  var totalMl = <String, int>{}.obs;
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    for (var cat in categories) {
      selectedTypeIndex[cat] = 0;
      totalMl[cat] = 0;
    }
    loadCart();
  }

  void addItem(String category) {
    totalMl[category] = (totalMl[category] ?? 0) + 30;
    saveCart();
  }

  void removeItem(String category) {
    if ((totalMl[category] ?? 0) > 0) {
      totalMl[category] = totalMl[category]! - 30;
    }
    saveCart();
  }

  int getSmall(String category) {
    int small = ((totalMl[category] ?? 0) % 60) ~/ 30;
    if (bogoOffers[category]?.contains(selectedTypeIndex[category]) ?? false) {
      small *= 2;
    }
    return small;
  }

  int getLarge(String category) {
    int large = (totalMl[category] ?? 0) ~/ 60;
    if (bogoOffers[category]?.contains(selectedTypeIndex[category]) ?? false) {
      large *= 1;
    }
    return large;
  }

  Map<String, dynamic> getCurrentItem(String category) {
    return liquorData[category]![selectedTypeIndex[category] ?? 0];
  }

  int getTotalPrice() {
    int total = 0;
    for (var cat in categories) {
      var item = getCurrentItem(cat);
      int price = item['price'];

      if (bogoOffers[cat]?.contains(selectedTypeIndex[cat]) ?? false) {
        total += ((getSmall(cat) ~/ 2) * price) + ((getLarge(cat) ~/ 2) * price * 2);
      } else {
        total += (getSmall(cat) * price) + (getLarge(cat) * price * 2);
      }
    }
    return total;
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    // पहले से save data निकालो
    final existingData = prefs.getString("cart_items");
    List<Map<String, dynamic>> existingCart = [];
    if (existingData != null) {
      existingCart = List<Map<String, dynamic>>.from(jsonDecode(existingData));
    }

    // Liquor की नई values बनाओ
    List<Map<String, dynamic>> newLiquorItems = [];
    for (var cat in categories) {
      var item = getCurrentItem(cat);
      int small = getSmall(cat);
      int large = getLarge(cat);
      if (small > 0 || large > 0) {
        newLiquorItems.add({
          "category": cat,
          "name": item['name'],
          "price": item['price'],
          "image": item['image'],
          "small": small,
          "large": large,
          "bogo": bogoOffers[cat]?.contains(selectedTypeIndex[cat]) ?? false,
          "type": "liquor",
        });
      }
    }

    existingCart.removeWhere((item) => item["type"] == "liquor");

    existingCart.addAll(newLiquorItems);

    // update local cartItems
    cartItems.value = existingCart;

    // SharedPreferences में save
    await prefs.setString("cart_items", jsonEncode(existingCart));
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("cart_items");
    if (data != null) {
      cartItems.value = List<Map<String, dynamic>>.from(jsonDecode(data));
    }
  }
}





