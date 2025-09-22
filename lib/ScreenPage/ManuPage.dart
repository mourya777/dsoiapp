import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/UtilsPage/ColorsPage.dart';
import '../ControllerPage/ManuController.dart';
import '../wedgetPage/AppBar.dart';
import 'Liquors.dart';
import 'ManuItemPage.dart';

class MenuView extends StatelessWidget {
  MenuView({Key? key}) : super(key: key);

  final MenuCardController controller = Get.put(MenuCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvancedAppBar(),
      backgroundColor: AppColors.white,
      body: Obx(() {
        return Container(
          color: AppColors.primary.withOpacity(0.5),
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            itemCount: controller.menuCards.length,
            itemBuilder: (context, index) {
              final card = controller.menuCards[index];

              int itemCount = 0;
              switch (card.name) {
                case "Vegetarian":
                  itemCount = controller.vegItems.length;
                  break;
                case "Non-Vegetarian":
                  itemCount = controller.nonVegItems.length;
                  break;
                case "Snack":
                  itemCount = controller.snacks.length;
                  break;
                case "Drinks":
                  itemCount = controller.drinks.length;
                  break;
                case "Liquors":
                  itemCount = 0; // Or any number if needed
                  break;
              }

              return GestureDetector(
                onTap: () {
                  if (index == controller.menuCards.length - 1) {
                    Get.to(() => LiquorPage());
                  } else {
                    Get.to(() => MenuItemsView(
                        categoryIndex: index, categoryName: card.name));
                  }
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                              card.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            card.name,
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Circle showing item count
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
