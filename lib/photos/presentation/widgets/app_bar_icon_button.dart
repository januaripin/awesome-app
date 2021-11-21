import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.icon,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: active ? AppColors.orange : AppColors.grey,
        size: active ? 32 : 16,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.expand(
        width: 42,
        height: 42,
      ),
    );
  }
}
