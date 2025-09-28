import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/ProfileController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AdvancedAppBar(),

      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary.withOpacity(0.2),
        child: Padding(
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
                      backgroundImage:
                      AssetImage("Assets/Images/profile_images.jpeg"),
                    ),
                    const SizedBox(width: 16),
                    Obx(
                          () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileController.homeController.memberName.value,
                            style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.person, color: AppColors.primary),
                              const SizedBox(width: 5),
                              Text(
                                profileController.homeController.memberType.value,
                                style: const TextStyle(
                                    color: AppColors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: AppColors.primary),
                              const SizedBox(width: 5),
                              Text(
                                profileController.homeController.location.value,
                                style: const TextStyle(
                                    color: AppColors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Buttons
              _buildProfileButton(
                  icon: Icons.edit,
                  text: "SOLDIER DETAILS",
                  onTap: () => profileController.showUserDetailsSheet(context)),
              const SizedBox(height: 16),
              _buildProfileButton(
                  icon: Icons.lock_reset,
                  text: "RESET PIN",
                  onTap: () => profileController.showResetPinSheet(context)),
              const SizedBox(height: 16),
              _buildProfileButton(
                  icon: Icons.logout,
                  text: "LOGOUT",
                  onTap: () => profileController.showLogoutConfirmation(context)),
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
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}




