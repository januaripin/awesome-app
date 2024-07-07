import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/controllers/photos_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:awesome_app/photos/presentation/widgets/photo_item.dart';
import 'package:core/core.dart';
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
      body: RefreshIndicator(
        onRefresh: () => _photosController.refreshData(),
        displacement: MediaQuery.of(context).size.height / 4,
        child: Obx(() => CustomScrollView(
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
                if (_photosController.isLoading.value)
                  const SliverToBoxAdapter(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        height: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: _buildSliverPhotos,
                ),
                if (_photosController.isLoadingMore.value)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                if (_photosController.errorMessage.value.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      color: AppColors.red,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            _photosController.errorMessage.value,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: Colors.white,
                                    ),
                          )),
                          Gap.p16(),
                          TextButton(
                              onPressed: () => _photosController.retry(),
                              child: Text(
                                'Retry',
                                style: Theme.of(context).textTheme.bodyText1,
                              ))
                        ],
                      ),
                    ),
                  ),
              ],
            )),
      ),
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

  SliverMasonryGrid get _buildGridLayout => SliverMasonryGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        itemBuilder: (context, index) {
          if (index == _photosController.photos.length - 3) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _photosController.nextPage();
            });
          }
          return PhotoItem(photo: _photosController.photos[index]);
        },
        childCount: _photosController.photos.length,
      );
}
