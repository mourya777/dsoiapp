import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../PageController/OrderControllerPage.dart';
import '../Utils/ColorsPage.dart';

import '../Utils/StringsPage.dart';

class OrdersPage extends StatelessWidget {
  final String category;
  OrdersPage({super.key, required this.category});

  final OrdersController controller = Get.put(OrdersController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.loadOrders(category);
    final size = MediaQuery.of(context).size;
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
              height: 75,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white, size: 28),
              onPressed: () {
                _showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.primary.withOpacity(0.2),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(), // ya Navigator.pop(context)
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width * 0.33,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search by Order ID or Date",
                          prefixIcon: const Icon(Icons.search),
                          filled: true, // ✅ background enable karne ke liye
                          fillColor: AppColors.white, // ✅ background color white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none, // ✅ border remove for clean look
                          ),
                        ),
                        onChanged: (_) => controller.orders.refresh(),
                      ),
                    ),
                  ),
                  Expanded(child: Text(''))
                ],
              ),
              const SizedBox(height: 10),
              // 3 sections in Row
              Expanded(
                child: Obx(() {
                  List<Map<String, dynamic>> pendingOrders = controller
                      .getOrdersByStatus("Pending", searchController.text);
                  List<Map<String, dynamic>> inProgressOrders = controller
                      .getOrdersByStatus("InProgress", searchController.text);
                  List<Map<String, dynamic>> completeOrders = controller
                      .getOrdersByStatus("Complete", searchController.text);

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection("Pending", pendingOrders),
                      const SizedBox(width: 10),
                      _buildSection("InProgress", inProgressOrders),
                      const SizedBox(width: 10),
                      _buildSection("Complete", completeOrders),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> ordersList) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.white,
            child: Center(
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: ordersList
                  .map((order) => _buildOrderCard(order))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order ID: ${order["orderId"]}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Category: ${order["category"]}"),
            Text("Status: ${order["status"]}"),
            Text("Date: ${order["date"]}"),
            const SizedBox(height: 5),
            // Outer side buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => controller.updateStatus(order, "Pending"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    "Pending",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => controller.updateStatus(order, "InProgress"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "InProgress",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => controller.updateStatus(order, "Complete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Complete",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Column(
            children: [
              ...order["items"].map<Widget>((item) {
                return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: item["selected"].value,
                            onChanged: (val) {
                              item["selected"].value = val!;
                            },
                          ),
                          Text("${item["name"]}"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text("${item["price"]}/-"),
                      ),
                    ],
                  ),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.cancelOrder(order),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () => controller.resetOrder(order),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text(
                        "Reset",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54, // background blur
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.exit_to_app, size: 50, color: Colors.red),
                  const SizedBox(height: 15),
                  const Text(
                    "Logout",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Are you sure you want to logout?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.cancel, color: AppColors.red),SizedBox(width: 5,),
                            const Text("Cancel",style: TextStyle(color: AppColors.red),),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context); // close popup
                          Navigator.pushReplacementNamed(context, "/splash");
                          // yaha "/splash" ko aapke SplashScreen ka route name rakhe
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),SizedBox(width: 5,),
                            const Text("Yes, Logout",style: TextStyle(color: AppColors.white),),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
          child: child,
        );
      },
    );
  }

}
