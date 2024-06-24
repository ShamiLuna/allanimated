// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:listeffect/shriktoplist.dart';
//
// class ListController extends GetxController {
//   final scrollController = ScrollController();
//   final items = List.generate(20, (index) => 'Item $index').obs;
//
//   void onScroll() {
//     update();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     scrollController.addListener(onScroll);
//   }
//
//   @override
//   void onClose() {
//     scrollController.removeListener(onScroll);
//     scrollController.dispose();
//     super.onClose();
//   }
//
//   double getOpacity(int index) {
//     final heightFactor = 0.8;
//     final itemPositionOffset = index * itemSize * heightFactor;
//     final difference = scrollController.offset - itemPositionOffset;
//     final percent = 1.0 - (difference / (itemSize * heightFactor));
//     double opacity = percent;
//     if (opacity > 1.0) opacity = 1.0;
//     if (opacity < 0.0) opacity = 0.0;
//     return opacity;
//   }
//
//   double getScale(int index) {
//     final heightFactor = 0.8;
//     final itemPositionOffset = index * itemSize * heightFactor;
//     final difference = scrollController.offset - itemPositionOffset;
//     final percent = 1.0 - (difference / (itemSize * heightFactor));
//     double scale = percent;
//     if (scale > 1.0) scale = 1.0;
//     return scale;
//   }
// }
// list_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

const itemSize = 150.0;

class ListController extends GetxController {
  final scrollController = ScrollController();
  final items = List.generate(20, (index) => 'Item $index').obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    update();
  }

  double getOpacity(int index) {
    const heightFactor = 0.8;
    final itemPositionOffset = index * itemSize * heightFactor;
    final difference = scrollController.offset - itemPositionOffset;
    final percent = 1.0 - (difference / (itemSize * heightFactor));
    double opacity = percent;
    if (opacity > 1.0) opacity = 1.0;
    if (opacity < 0.0) opacity = 0.0;
    return opacity;
  }

  double getScale(int index) {
    const heightFactor = 0.8;
    final itemPositionOffset = index * itemSize * heightFactor;
    final difference = scrollController.offset - itemPositionOffset;
    final percent = 1.0 - (difference / (itemSize * heightFactor));
    double scale = percent;
    if (scale > 1.0) scale = 1.0;
    return scale;
  }

  @override
  void onClose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
