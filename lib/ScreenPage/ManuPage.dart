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
            padding: EdgeInsets.only( left: 16, right: 16),
            itemCount: controller.menuCards.length,
            itemBuilder: (context, index) {
              final card = controller.menuCards[index];
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
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 120,
                            height: 120,
                            color: Colors.grey[200],
                            child: Image.asset(
                              card.image,
                              fit: BoxFit.contain, // ensures full image visible
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          card.name,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
