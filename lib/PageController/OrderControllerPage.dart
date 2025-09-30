// OrdersControllerPage.dart
import 'package:get/get.dart';

class OrdersController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders("Food"); // default data
  }

  void loadOrders(String category) {
    List<Map<String, dynamic>> dummyOrders = List.generate(10, (index) {
      return {
        "orderId": "${category[0]}00$index",
        "category": category,
        "status": "Pending",
        "date": "2025-09-${30 - index}",
        "items": List.generate(2, (i) => {
          "name": "$category Item ${i + 1}",
          "price": 50 + i * 10,
          "selected": false.obs
        }),
      };
    });
    orders.value = dummyOrders;
  }

  // Filter orders by status and search query
  List<Map<String, dynamic>> getOrdersByStatus(String status, String searchQuery) {
    return orders.where((o) {
      bool statusMatch = o["status"] == status;
      bool searchMatch = searchQuery.isEmpty ||
          o["orderId"].contains(searchQuery) ||
          o["date"].contains(searchQuery);
      return statusMatch && searchMatch;
    }).toList();
  }

  // Update order status
  void updateStatus(Map<String, dynamic> order, String newStatus) {
    order["status"] = newStatus;
    orders.refresh();
  }

  // Cancel order
  void cancelOrder(Map<String, dynamic> order) {
    orders.remove(order);
    orders.refresh();
  }

  // Reset order to Pending
  void resetOrder(Map<String, dynamic> order) {
    updateStatus(order, "Pending");
  }
}
