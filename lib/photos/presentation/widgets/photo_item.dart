import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  final _radius = const Radius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('${photo.id}'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(_radius)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: _radius,
              topLeft: _radius,
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.grey,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              imageUrl: photo.src.large,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 8,
              right: 8,
              bottom: 16,
            ),
            child: Row(
              children: [
                Text('by ', style: Theme.of(context).textTheme.bodyText2),
                Expanded(
                  child: Text(
                    photo.photographer ?? 'NN',
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.download))
              ],
            ),
          )
        ],
      ),
    );
  }
}
