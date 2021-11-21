import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/controllers/photos_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:awesome_app/photos/presentation/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class PhotosPage extends StatelessWidget {
  PhotosPage({Key? key}) : super(key: key);

  final _iconController = Get.put(IconController());
  final _photosController = Get.put(PhotosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => CustomScrollView(
            controller: _photosController.scroll,
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                sliver: _buildSliverPhotos,
              )
            ],
          )),
    );
  }

  SliverWithKeepAliveWidget get _buildSliverPhotos =>
      _iconController.isGrid ? _buildGridLayout : _buildListLayout;

  SliverList get _buildListLayout => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PhotoItem(photo: _photosController.photos[index]),
          ),
          childCount: _photosController.photos.length,
        ),
      );

  SliverStaggeredGrid get _buildGridLayout => SliverStaggeredGrid.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        itemBuilder: (context, index) =>
            PhotoItem(photo: _photosController.photos[index]),
        itemCount: _photosController.photos.length,
      );
}
