import 'package:get/get.dart';

import '../ApiControllers/ManuApiControllerPage.dart';
import '../ModelsPage/MenuModels.dart';
import '../UtilsPage/SessionManager.dart';


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
}


