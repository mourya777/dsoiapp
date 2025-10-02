import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiControllers/OrdersApi.dart';

class OrderHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var searchDate = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactionsFromApi();
  }

  void loadTransactionsFromApi() async {
    var body = {
      "member_id": "1",
      "member_code": "053319822544",
      "member_date": "2019-11-20",
      "device_token": "12121313131311212",
    };
    var result = await TransactionApiService.fetchTransactions(body);
    transactions.value = result;
    print("transaction details${result}");
  }

  List<Map<String, dynamic>> get filteredTransactions {
    if (searchDate.value.isEmpty) {
      return transactions;
    }
    return transactions.where((tx) {
      final tranId = tx["tran_id"]?.toString().toLowerCase() ?? '';
      final tranDate = tx["tran_date"]?.toString().toLowerCase() ?? '';
      final query = searchDate.value.toLowerCase();
      return tranId.contains(query) || tranDate.contains(query);
    }).toList();
  }
}
