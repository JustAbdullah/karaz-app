import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/services/appservices.dart';
import '../views/WelcomeScreen/welcome_screen.dart';

abstract class onBoardingController extends GetxController {
  next();

  onPageChange(int index);
}

class onBoardingControllerImp extends onBoardingController {
  late PageController pageController;

  AppServices appServices = Get.find();

  RxInt currntPage = 0.obs;
  @override
  next() {
    if (currntPage.value > 2) {
      // appServices.sharedPreferences.setInt('TrackRoute', 2);
      Get.to(() => WelcomeScreen());
    } else {
      currntPage++;
      pageController.animateToPage(currntPage.value,
          duration: Duration(microseconds: 500), curve: Curves.bounceOut);
      /*  appServices.sharedPreferences.setBool("isEndOnBoarding", false);*/
    }
  }

  @override
  onPageChange(int index) {
    currntPage.value = index;
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
