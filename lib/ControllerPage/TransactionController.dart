import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiControllers/OrdersApi.dart';
import '../UtilsPage/SessionManager.dart';



class TransactionHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var searchDate = "".obs;
  var isLoading = true.obs; // ✅ isLoading variable add करें

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() async {
    try {
      isLoading.value = true; // ✅ Loading start

      final memberData = GlobalPrefs.getMemberData();

      if (memberData != null) {
        final body = {
          "member_id": "1",
          "member_code": "053319822544",
          "member_date": "2019-11-20",
          "device_token": "12121313131311212"
        };

        final list = await TransactionApiService.fetchTransactions(body);

        if (list.isNotEmpty) {
          // Sort by date descending
          list.sort((a, b) => b["date"].compareTo(a["date"]));
          transactions.assignAll(list);
        }
      }
    } catch (e) {
      print("Error loading transactions: $e");
    } finally {
      isLoading.value = false; // ✅ Loading complete
    }
  }

  List<Map<String, dynamic>> get filteredTransactions {
    if (searchDate.value.isEmpty) {
      return transactions;
    }

    return transactions.where((tx) {
      final date = tx["date"]?.toString().toLowerCase() ?? '';
      final query = searchDate.value.toLowerCase();
      return date.contains(query);
    }).toList();
  }
}