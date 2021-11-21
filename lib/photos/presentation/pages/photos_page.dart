import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotosPage extends StatelessWidget {
  PhotosPage({Key? key}) : super(key: key);

  final _layoutController = Get.put(IconController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Awesome',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        actions: [
          AppBarIconButton(
            iconType: IconType.grid,
          ),
          AppBarIconButton(
            iconType: IconType.list,
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [],
      ),
    );
  }
}
