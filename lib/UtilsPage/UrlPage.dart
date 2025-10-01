class ApiConfig {
  static const String baseUrl =
      "https://7eyeitsolutions.com/dsoijbp/angular/Dsoi_api_pos/";

  static const String allCatSubcat = "${baseUrl}all_cat_subcat_event";
  static const String staffLogin = "${baseUrl}staff_login";
  static const String getAttendence = "${baseUrl}get_attendence";
  static const String getMenuItems = "${baseUrl}get_menu_items";
  static const String productCat = "${baseUrl}product_cat";
  static const String orderNow = "${baseUrl}order_now";
  static const String mobileNumberCheck = "${baseUrl}mobile_numbercheck";
  static const String mobileOTPVerify = "${baseUrl}mobile_otpverify";
  static const String memberMpinSet = "${baseUrl}member_mpinset";




  static const Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };


}
class TempCart {
  static List<Map<String, dynamic>> menuItems = [];     // Manu / normal items
  static List<Map<String, dynamic>> liquorItems = [];   // Liquor items
  static List<Map<String, dynamic>> fastFoodItems = []; // Fast Food items
}
