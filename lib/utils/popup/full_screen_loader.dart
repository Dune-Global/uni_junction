import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_junction/common/widgets/loaders/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: TAnimationLoaderWidget(text: text, animation: animation),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}