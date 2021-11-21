import 'package:get/get.dart';

class IconController extends GetxController {
  final iconType = IconType.grid.obs;

  void changeType(IconType type) {
    iconType.value = type;
  }

  bool get isGrid => iconType.value == IconType.grid;

  bool get isList => iconType.value == IconType.list;

  bool equals(IconType type) => iconType.value == type;
}

enum IconType { grid, list }
