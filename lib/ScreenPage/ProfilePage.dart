import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/ScreenPage/splashPage.dart';
import '../ControllerPage/SplashController.dart';
import '../UtilsPage/ColorsPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Info Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("Assets/Images/profile_images.jpeg"),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rahul Sharma",
                          style: TextStyle(
                              color: AppColors.golden,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Main Member",
                          style: TextStyle(color: AppColors.golden, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "DOI JABALPUR",
                          style: TextStyle(color: AppColors.golden, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Buttons
              _buildProfileButton(
                  icon: Icons.edit,
                  text: "Edit Profile",
                  onTap: () => _showEditProfileSheet(context)),
              const SizedBox(height: 16),
              _buildProfileButton(
                  icon: Icons.lock_reset,
                  text: "Reset PIN",
                  onTap: () => _showResetPinSheet(context)),
              const SizedBox(height: 16),
              _buildProfileButton(
                  icon: Icons.logout,
                  text: "Logout",
                  onTap: () {
                    Get.snackbar("Logout", "You have been logged out",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.primary,
                        colorText: Colors.white);
                    Get.delete<SplashController>(); // purana controller hata do
                    Get.offAll(() => SplashScreen()); // splash screen pe bhej do

                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton(
      {required IconData icon,
        required String text,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.golden),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.golden, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // BottomSheet: Reset PIN
  void _showResetPinSheet(BuildContext context) {
    final TextEditingController oldPin = TextEditingController();
    final TextEditingController newPin = TextEditingController();
    final TextEditingController confirmPin = TextEditingController();

    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: BoxDecoration(
            color:AppColors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Reset PIN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.golden,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Old PIN
              TextField(
                controller: oldPin,
                keyboardType: TextInputType.number,
                obscureText: true,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Old PIN",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  hintText: "Old PIN",
                  hintStyle: const TextStyle(color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  prefixIcon: const Icon(Icons.lock, color: AppColors.khakiLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.khakiLight, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // New PIN
              TextField(
                controller: newPin,
                keyboardType: TextInputType.number,
                obscureText: true,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "New PIN",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  hintText: "New PIN",
                  hintStyle: const TextStyle(color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  prefixIcon: const Icon(Icons.lock, color: AppColors.khakiLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.khakiLight, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Confirm PIN
              TextField(
                controller: confirmPin,
                keyboardType: TextInputType.number,
                obscureText: true,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Confirm PIN",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  hintText: "Confirm PIN",
                  hintStyle: const TextStyle(color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  prefixIcon: const Icon(Icons.lock, color: AppColors.khakiLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.khakiLight, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Reset PIN Button
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.khaki.withOpacity(0.6),
                        offset: const Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (newPin.text == confirmPin.text && oldPin.text.isNotEmpty) {
                        Get.back();
                        Get.snackbar(
                          "Success",
                          "PIN reset successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.khakiLight,
                          colorText: AppColors.golden,
                        );
                      } else {
                        Get.snackbar(
                          "Error",
                          "PIN mismatch or empty",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: const Text(
                      "Reset PIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );

  }

  // BottomSheet: Edit Profile
  void _showEditProfileSheet(BuildContext context) {
    final TextEditingController nameController =
    TextEditingController(text: "Rahul Sharma");
    final TextEditingController memberTypeController =
    TextEditingController(text: "Main Member");
    final size = MediaQuery.of(context).size;

    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.golden),
                ),
              ),
              const SizedBox(height: 15),

              // Name input
              TextField(
                controller: nameController,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  prefixIcon: const Icon(Icons.person, color: AppColors.khakiLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.khakiLight, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Member Type input
              TextField(
                controller: memberTypeController,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Member Type",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  hintText: "Enter Member Type",
                  hintStyle: const TextStyle(color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  prefixIcon: const Icon(Icons.group, color: AppColors.khakiLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.khakiLight, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save button with gradient + shadow
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.khaki.withOpacity(0.6),
                        offset: const Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      Get.snackbar(
                        "Success",
                        "Profile updated successfully",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.khakiLight,
                        colorText: AppColors.golden,
                      );
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

}
