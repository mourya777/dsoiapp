import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ControllerPage/ManuController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../UtilsPage/StringsPage.dart';
import '../wedgetPage/CustomeText.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/VerifyRFIDPopup.dart';
import 'FastFoodPage.dart';
import 'FoodMenuPage.dart';
import 'LiquorsPage.dart';
import 'ManuItemPage.dart';
import 'buttombarPage.dart';

class MenuView extends StatelessWidget {
  MenuView({Key? key}) : super(key: key);

  final MenuCardController controller = Get.put(MenuCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/appbar_logo-removebg-preview.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Text(
              "${AppStrings.locationJabalpur}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900, // aur bold
                color: AppColors.white, // AppColors.golden bhi use kar sakte ho
                letterSpacing: 1.5, // thoda space letters ke beech
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(BottomNavPage());
                },
                icon: Icon(Icons.menu, color: AppColors.white),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Obx(() {
        if (controller.menuCards.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          color: AppColors.primary.withOpacity(0.2),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.menuCards.length,
            itemBuilder: (context, index) {
              final card = controller.menuCards[index];


              return GestureDetector(
                onTap: () async {
                  final loggedIn = await SessionManager.isLoggedIn();
                  final catId = card.catId;

                  void navigate() {
                    final typeLower = card.title.toLowerCase();
                    print("🔄 NAVIGATING: '$typeLower' (catId: $catId)");

                    // Ensure proper GlobalCart setup
                    if (typeLower.contains("liquor") || catId == "2") {
                      int cartIndex = 1;
                      GlobalCart.cartData[cartIndex]["cat_id"] = "2";
                      print("✅ NAVIGATING TO LIQUOR (GlobalCart index: $cartIndex)");
                      Get.to(() => LiquorPage(catId: "2"));
                    }
                    else if (typeLower.contains("fast") || catId == "90") {
                      int cartIndex = 2;
                      GlobalCart.cartData[cartIndex]["cat_id"] = "90";
                      print("✅ NAVIGATING TO FASTFOOD (GlobalCart index: $cartIndex)");
                      Get.to(() => FastFoodPage(catId: "90"));
                    }
                    else {
                      int cartIndex = 0;
                      GlobalCart.cartData[cartIndex]["cat_id"] = "1";
                      print("✅ NAVIGATING TO FOOD (GlobalCart index: $cartIndex)");
                      Get.to(() => FoodPage(catId: "1"));
                    }
                  }

                  if (loggedIn) {
                    navigate();
                  } else {
                    RFIDDialog.show(
                      context,
                      card.title,
                      onVerified: () {
                        navigate();
                      },
                    );
                  }
                },


                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: Image.asset(
                              controller.getCardImage(card.title),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: AdvancedTitleText(title: card.title)),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
