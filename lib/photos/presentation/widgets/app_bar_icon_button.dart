import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarIconButton extends StatelessWidget {
  AppBarIconButton({Key? key, required this.iconType}) : super(key: key);

  final IconType iconType;
  final _controller = Get.find<IconController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          icon: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              iconType == IconType.grid ? Icons.grid_view : Icons.list,
              color: _controller.equals(iconType)
                  ? AppColors.orange
                  : AppColors.grey,
              size: _controller.equals(iconType) ? 32 : 16,
            ),
          ),
          onPressed: () => _controller.changeType(iconType),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints.expand(
            width: 42,
            height: 42,
          ),
        ));
  }
}
