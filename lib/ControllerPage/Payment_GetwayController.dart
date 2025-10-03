import 'package:get/get.dart';
import '../ApiControllers/TransactionApi.dart';
import '../UtilsPage/SessionManager.dart';


// class OrderHistoryController extends GetxController {
//   var transactions = <Map<String, dynamic>>[].obs;
//   var searchText = "".obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadTransactions();
//   }
//
//   void loadTransactions() async {
//     final memberData = GlobalPrefs.getMemberData();
//
//     if (memberData != null) {
//       final body = {
//         "member_id": "1",
//         "member_code": "053319822544",
//         "member_date": "2019-11-20",
//         "device_token": "12121313131311212"
//       };
//
//       final list = await TransactionApiService.getTransactions(body);
//
//       if (list.isNotEmpty) {
//         // Sort by date descending
//         list.sort((a, b) => b["date"].compareTo(a["date"]));
//
//         transactions.assignAll(list);
//       }
//     }
//   }
//
//   List<Map<String, dynamic>> get filteredTransactions {
//     if (searchText.value.isEmpty) {
//       return transactions;
//     }
//
//     return transactions.where((tx) {
//       final id = tx["tran_id"].toString().toLowerCase();
//       final date = tx["date"].toString().toLowerCase();
//       final query = searchText.value.toLowerCase();
//
//       return id.contains(query) || date.contains(query);
//     }).toList();
//   }
// }




class OrderHistoryController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var searchText = "".obs;
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

        final list = await TransactionApiService.getTransactions(body);

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




