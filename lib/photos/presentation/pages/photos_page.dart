import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotosPage extends StatelessWidget {
  PhotosPage({Key? key}) : super(key: key);

  final _iconController = Get.put(IconController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  'Awesome',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SliverAppBar(
                pinned: true,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Photos',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    AppBarIconButton(
                      icon: Icons.grid_view,
                      active: _iconController.isGrid,
                      onPressed: () =>
                          _iconController.changeType(IconType.grid),
                    ),
                    AppBarIconButton(
                      icon: Icons.list,
                      active: _iconController.isList,
                      onPressed: () =>
                          _iconController.changeType(IconType.list),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
