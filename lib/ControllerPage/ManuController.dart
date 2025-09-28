import 'package:get/get.dart';

import '../ApiControllers/ManuApiControllerPage.dart';
import '../ModelsPage/MenuModels.dart';
import '../UtilsPage/SessionManager.dart';

class MenuItemModel {
  final String name;
  final String price;
  final String image;

  MenuItemModel({required this.name, required this.price, required this.image});
}

class MenuCardModel {
  final String name;
  final String image;

  MenuCardModel({required this.name, required this.image});
}

class MenuCardController extends GetxController {
  var menuCards = <CategoryModel>[].obs; // ✅ Correct type
  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchMenuCards();
  }

  void fetchMenuCards() async {
    final menu = await apiService.fetchMenu(); // ✅ Instance method
    if (menu != null) {
      menuCards.value = menu.categories; // ✅ Type matches
    }
  }


  String getCardImage(String title) {
    switch (title.toLowerCase()) {
      case "food":
        return "Assets/Liquor/Food.jpeg";
      case "liquor":
        return "Assets/Liquor/liquors.jpeg";
      case "fast food":
        return "Assets/Liquor/fast_food.jpeg";
      default:
        return "assets/images/placeholder.png"; // default image
    }
  }


  // Menu categories
  final RxList<MenuCardModel> menuCards1 = <MenuCardModel>[
    MenuCardModel(
      name: "Vegetarian",
      image: "Assets/Veg/Paneer Butter Masala.jpeg",
    ),
    MenuCardModel(
      name: "Non-Vegetarian",
      image: "Assets/Non-Veg/Fish Fry.jpeg",
    ),
    MenuCardModel(
      name: "Snack",
      image: "Assets/Snack/Veg SpRoll.jpeg",
    ),
    MenuCardModel(
      name: "Drinks",
      image: "Assets/Drink/Green Tea.jpeg",
    ), MenuCardModel(
      name: "Liquors",
      image: "Assets/Liquor/Gin.jpeg",
    ),
  ].obs;

  // Veg items
  final RxList<MenuItemModel> vegItems = <MenuItemModel>[
    MenuItemModel(name: "Paneer Butter Masala", price: "₹250", image: "Assets/Veg/Paneer Butter Masala.jpeg"),
    MenuItemModel(name: "Chole", price: "₹180", image: "Assets/Veg/Chole (Chickpea Curry).jpeg"),
    MenuItemModel(name: "Aloo Gobi", price: "₹180", image: "Assets/Veg/Aloo Gobi (Potato & Cauliflower Curry).jpeg"),
    MenuItemModel(name: "Palak Paneer", price: "₹250", image: "Assets/Veg/Palak Paneer (Spinach with Cottage Cheese).jpeg"),
    MenuItemModel(name: "Vegetable Biryani", price: "₹220", image: "Assets/Veg/Vegetable Biryani.jpeg"),
    MenuItemModel(name: "Dal Tadka", price: "₹150", image: "Assets/Veg/Dal Tadka (Lentil Curry).jpeg"),
    MenuItemModel(name: "Baingan Bharta", price: "₹200", image: "Assets/Veg/Baingan Bharta (Mashed Eggplant).jpeg"),
    MenuItemModel(name: "Matar Paneer", price: "₹240", image: "Assets/Veg/Matar Paneer (Peas with Cottage Cheese).jpeg"),
    MenuItemModel(name: "Rajma", price: "₹180", image: "Assets/Veg/Rajma (Kidney Bean Curry).jpeg"),
    MenuItemModel(name: "Mixed Vegetable Curry", price: "₹200", image: "Assets/Veg/Mixed Vegetable Curry.jpeg"),
  ].obs;

  // Non-Veg items
  final RxList<MenuItemModel> nonVegItems = <MenuItemModel>[
    MenuItemModel(name: "Chicken Biryani", price: "₹360", image: "Assets/Non-Veg/download.jpeg"),
    MenuItemModel(name: "Grilled Chicken", price: "₹330", image: "Assets/Non-Veg/Grilled Chicken.jpeg"),
    MenuItemModel(name: "Mutton Curry", price: "₹350", image: "Assets/Non-Veg/Mutton Curry.jpeg"),
    MenuItemModel(name: "Fish Fry", price: "₹350", image: "Assets/Non-Veg/Fish Fry.jpeg"),
    MenuItemModel(name: "Prawn Masala", price: "₹380", image: "Assets/Non-Veg/Prawn Masala.jpeg"),
    MenuItemModel(name: "Chicken Tikka", price: "₹320", image: "Assets/Non-Veg/Chicken Tikka.jpeg"),
    MenuItemModel(name: "Egg Curry", price: "₹180", image: "Assets/Non-Veg/Egg Curry.jpeg"),
    MenuItemModel(name: "Lamb Kebab", price: "₹400", image: "Assets/Non-Veg/Lamb Kebab.jpeg"),
    MenuItemModel(name: "Butter Chicken", price: "₹350", image: "Assets/Non-Veg/Butter Chicken.jpeg"),
    MenuItemModel(name: "Fish Curry", price: "₹340", image: "Assets/Non-Veg/Fish Curry.jpeg"),
  ].obs;

  // Snacks
  final RxList<MenuItemModel> snacks = <MenuItemModel>[
    MenuItemModel(name: "Samosa", price: "₹40", image: "Assets/Snack/Samosa.jpeg"),
    MenuItemModel(name: "Pakora", price: "₹50", image: "Assets/Snack/Pakora (Vegetable Fritters).jpeg"),
    MenuItemModel(name: "Aloo Tikki", price: "₹40", image: "Assets/Snack/Aloo Tikki (Potato Patties).jpeg"),
    MenuItemModel(name: "Paneer Tikka", price: "₹80", image: "Assets/Snack/Paneer Tikka.jpeg"),
    MenuItemModel(name: "Dhokla", price: "₹60", image: "Assets/Snack/Dhokla.jpeg"),
    MenuItemModel(name: "Vada Pav", price: "₹30", image: "Assets/Snack/Vada Pav.jpeg"),
    MenuItemModel(name: "Corn Chaat", price: "₹50", image: "Assets/Snack/Corn Chaat.jpeg"),
    MenuItemModel(name: "Cheese Sandwich", price: "₹70", image: "Assets/Snack/Cheese Sandwich.jpeg"),
    MenuItemModel(name: "Sev Puri", price: "₹60", image: "Assets/Snack/Sev Puri .jpeg"),
    MenuItemModel(name: "Vegetable Spring Roll", price: "₹80", image: "Assets/Snack/Veg SpRoll.jpeg"),
  ].obs;

  // Drinks
  final RxList<MenuItemModel> drinks = <MenuItemModel>[
    MenuItemModel(name: "Lemonade", price: "₹50", image: "Assets/Drink/Lemonade.jpeg"),
    MenuItemModel(name: "Masala Chai", price: "₹30", image: "Assets/Drink/Masala Chai (Spiced Tea).jpeg"),
    MenuItemModel(name: "Green Tea", price: "₹50", image: "Assets/Drink/Green Tea.jpeg"),
    MenuItemModel(name: "Coffee", price: "₹40", image: "Assets/Drink/Coffee.jpeg"),
    MenuItemModel(name: "Mango Shake", price: "₹80", image: "Assets/Drink/Mango Shake.jpeg"),
    MenuItemModel(name: "Lassi", price: "₹60", image: "Assets/Drink/Lassi (Sweet or Salted Yogurt Drink).jpeg"),
    MenuItemModel(name: "Cold Coffee", price: "₹70", image: "Assets/Drink/Cold Coffee .jpeg"),
    MenuItemModel(name: "Orange Juice", price: "₹60", image: "Assets/Drink/Orange Juice.jpeg"),
    MenuItemModel(name: "Smoothie", price: "₹90", image: "Assets/Drink/Smoothie (Fruit-based).jpeg"),
    MenuItemModel(name: "Buttermilk (Chaas)", price: "₹40", image: "Assets/Drink/Buttermilk (Chaas).jpeg"),
  ].obs;
}
