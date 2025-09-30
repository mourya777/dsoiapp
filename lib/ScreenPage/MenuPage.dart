import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Utils/ColorsPage.dart';
import '../Utils/StringsPage.dart';
import 'OrderPage.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 350; // card height same
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - 200) / 3; // width kam kiya

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        toolbarHeight: 80, // height badhaya
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/appbar_logo-removebg-preview.png',
              height: 75 ,
              width: 75,
            ),
            const SizedBox(width: 15),
            Text(
              "${AppStrings.locationJabalpur}",
              style: const TextStyle(
                fontSize: 20, // text size bada kiya
                fontWeight: FontWeight.w900,
                color: AppColors.white,
                letterSpacing: 1.5,
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
      ),
      backgroundColor: AppColors.khakiLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuCard(
                context,
                title: "Food",
                description: "Delicious meals and healthy dishes with fresh ingredients.",
                imagePath: "Assets/Veg/vegthali-removebg.png",
                cardHeight: cardHeight,
                cardWidth: cardWidth,
                category: 'Food',
              ),
              _buildMenuCard(
                context,
                title: "Liquor",
                category: "Liquor",
                description: "Wide range of premium spirits and cocktails for all occasions.",
                imagePath: "Assets/Liquor/liquor.jpeg",
                cardHeight: cardHeight,
                cardWidth: cardWidth,
              ),
              _buildMenuCard(
                context,
                title: "Fast Food",
                description: "Tasty burgers, pizzas, and snacks made instantly for you.",
                imagePath: "Assets/Snack/snack.jpeg",
                cardHeight: cardHeight,
                cardWidth: cardWidth,
                category: 'Fast Food',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title,
        required String description,
        required String imagePath,
        required double cardHeight,
        required double cardWidth, required String category}) {
    return InkWell(
      onTap:(){
        Get.to(OrdersPage(category: category));
      } ,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with padding
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  height: cardHeight * 0.50,
                  width: cardWidth - 20, // padding account
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Title & Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Button fixed at bottom
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [

                      AppColors.khaki,
                      AppColors.primary,
                      AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$title view clicked")),
                    );
                  },
                  child: const Text(
                    "VIEW",
                    style: TextStyle(
                      color: Colors.white, // white text
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
