import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/features/autentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index.toDouble());
  }

  // update current index & jump to next page
  void nextPage() {
   if (currentPageIndex.value == 2) {
      Get.to(const LoginScreen());
    } else {
      currentPageIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // update current index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
