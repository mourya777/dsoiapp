import 'package:get/get.dart';
import '../ApiControllers/TransactionApi.dart';
import '../UtilsPage/SessionManager.dart';

// class TransactionHistoryController extends GetxController {
//   var transactions = <Map<String, dynamic>>[].obs;
//   var searchDate = "".obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadTransactions();
//   }
//
//   void loadTransactions() async {
//     print('Api calling');
//     final memberData = GlobalPrefs.getMemberData();
//     print("Member Data: $memberData");
//
//     if (memberData != null) {
//       String? token = await GlobalStorage.getDeviceToken();
//       print("Device Token: $token");
//       final body = {
//         "member_id":"1",
//         "member_code":"053319822544",
//         "member_date":"2019-11-20",
//         "device_token":"12121313131311212"
//         // "member_id": memberData["member_id"] ?? memberData["member_no"] ?? "",
//         // "member_code": memberData["member_code"] ?? "",
//         // "device_token": token ?? "",
//         // "member_date": memberData["member_date"] ??
//         //     DateTime.now().toIso8601String().split("T")[0],
//       };
//
//       print("Sending API Request with Body: $body");
//       final list = await TransactionApiService.getTransactions(body);
//       print("Transactions Loaded: $list");
//       transactions.assignAll(list);
//     } else {
//       print("Member data is null");
//     }
//   }
//
//   List<Map<String, dynamic>> get filteredTransactions {
//     if (searchDate.value.isEmpty) return transactions;
//     return transactions
//         .where((tx) => tx["date"]
//         .toString()
//         .toLowerCase()
//         .contains(searchDate.value.toLowerCase()))
//         .toList();
//   }
// }
class TransactionHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var searchText = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() async {
    final memberData = GlobalPrefs.getMemberData();

    if (memberData != null) {
      final body = {
        "member_id": "1",
        "member_code": "053319822544",
        "member_date": "2019-11-20",
        "device_token": "12121313131311212"
      };

      final list = await TransactionApiService.getTransactions(body);

      if (list.isNotEmpty) {
        // Sort by date descending
        list.sort((a, b) => b["date"].compareTo(a["date"]));

        transactions.assignAll(list);
      }
    }
  }

  List<Map<String, dynamic>> get filteredTransactions {
    if (searchText.value.isEmpty) {
      return transactions;
    }

    return transactions.where((tx) {
      final id = tx["tran_id"].toString().toLowerCase();
      final date = tx["date"].toString().toLowerCase();
      final query = searchText.value.toLowerCase();

      return id.contains(query) || date.contains(query);
    }).toList();
  }
}
