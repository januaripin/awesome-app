import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:get/get.dart';

class PhotosController extends GetxController with ScrollMixin {
  final photos = <Photo>[];

  var page = 1;

  @override
  void onInit() {
    _fetchPhotos();
    super.onInit();
  }

  Future<void> _fetchPhotos() async {
    await Future.delayed(const Duration(seconds: 1), () {
      for (var i = 15 * (page - 1); i < (15 * page); i++) {
        photos.add(
          Photo(
            id: i,
            width: 720,
            height: 600 + (i * 30),
            photographerId: i,
            photographer: 'Photographer $i',
            src: PhotoSrc(
                large:
                    'https://via.placeholder.com/${720}x${600 + (i * 30)}?text=$i'),
          ),
        );
      }
    });
  }

  @override
  Future<void> onEndScroll() async {
    page++;
    await _fetchPhotos();
  }

  @override
  Future<void> onTopScroll() async {}
}
