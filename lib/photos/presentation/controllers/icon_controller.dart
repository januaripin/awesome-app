import 'package:get/get.dart';

class IconController extends GetxController {
  final iconType = IconType.grid.obs;

  @override
  void onInit() {
    iconType.value = IconType.grid;
    super.onInit();
  }

  void changeType(IconType type) {
    iconType.value = type;
  }

  bool get isGrid => iconType.value == IconType.grid;

  bool get isList => iconType.value == IconType.list;

  bool equals(IconType type) => iconType.value == type;
}

enum IconType { grid, list }
