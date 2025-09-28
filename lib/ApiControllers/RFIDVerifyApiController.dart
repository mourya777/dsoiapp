import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ModelsPage/RFIDModels.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/DetailsWidget.dart';

class AttendenceService {
  static Future<RfidResponse?> verifyRFID(String rfid) async {
    try {
      print("Sending RFID: $rfid");

      final response = await http.post(
        Uri.parse(ApiConfig.getAttendence),
        headers: ApiConfig.headers,
        body: jsonEncode({"member_rfid": rfid}),
      );

      print("Server response: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rfidResponse = RfidResponse.fromJson(data);

        if (rfidResponse.status == 1) {
          await UserPreferences.saveUserDetails(rfidResponse);
        }

        return rfidResponse;
      } else {
        return RfidResponse(
          status: 0,
          msg: "Server error: ${response.statusCode}",
          records: Records.fromJson({}), // empty object
          balance: "0.0",
          mainMemberName: "",
        );
      }
    } catch (e) {
      return RfidResponse(
        status: 0,
        msg: "Exception: $e",
        records: Records.fromJson({}), // empty object
        balance: "0.0",
        mainMemberName: "",
      );
    }
  }
}
