import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:awesome_app/photos/presentation/widgets/photo_item.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PhotoItem(
                photo: Photo(
                  id: 1,
                  width: 100,
                  height: 100,
                  photographerId: 1,
                  src: PhotoSrc(
                    large: 'https://via.placeholder.com/720x920?text=Awesomee',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
