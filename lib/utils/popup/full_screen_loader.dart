import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/loaders/animation_loader.dart';
import 'package:uni_junction/utils/constants/colors.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
