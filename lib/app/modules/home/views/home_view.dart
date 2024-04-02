import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skillmineauth/AuthUi/login_screen.dart';
import 'package:skillmineauth/AuthUi/registration_screen.dart';
import 'package:skillmineauth/Widgets/common_button.dart';
import 'package:skilminedemo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              buttonText: "Call skillmineAuth",
              onTap: () {
              Get.to(() => LoginScreen(onLoginResult: (map){
                Get.snackbar("Response", "Logged in successfully",snackPosition: SnackPosition.BOTTOM );
                Get.toNamed(Routes.DASHBOARD);
              }));

            },),

            CommonButton(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              buttonText: "SignUp",
              onTap: () {
                Get.to(() => RegistrationScreen(
                  onLogInBtnCallBack: () {
                    Get.to(() => LoginScreen(onLoginResult: (map){
                      Get.snackbar("Response", "Logged in successfully",snackPosition: SnackPosition.BOTTOM );
                      Get.toNamed(Routes.DASHBOARD);
                    }));
                  },
                  onSignUpResponse: (Map<dynamic, dynamic> map ) {
                    Get.to(() => LoginScreen(onLoginResult: (map){
                      Get.snackbar("Response", "SignUp successfully",snackPosition: SnackPosition.BOTTOM, );
                      Get.toNamed(Routes.DASHBOARD);
                    }));
                  },)
                );
                // NavigationServices(context).gotoTabScreen();
              },
            ),
          ],
        ),
      ),
    );
  }

}
