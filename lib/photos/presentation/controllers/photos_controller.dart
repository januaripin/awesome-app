import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/use_cases/fetch_photos.dart';
import 'package:core/exceptions.dart';
import 'package:get/get.dart';

class PhotosController extends GetxController with ScrollMixin {
  final photos = <Photo>[].obs;

  int _page = 1;
  bool _isRefresh = false;

  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    _fetchPhotos();
    super.onInit();
  }

  Future<void> refreshData() async {
    _page = 1;
    _isRefresh = true;
    photos.clear();
    await _fetchPhotos();
  }

  Future<void> nextPage() async {
    _page++;
    await _fetchPhotos();
  }

  Future<void> retry() async {
    await _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    errorMessage.value = '';
    isLoading.value = _page == 1 && !_isRefresh;
    isLoadingMore.value = _page > 1;

    final result = await Get.find<FetchPhotos>().call(_page);

    result.fold((l) {
      errorMessage.value = l.message ?? 'Unknown error';
    }, (r) {
        if (_page > 1 && r.isEmpty) {
          _page--;
        } else {
          photos.addAll(r);
        }
    });

    isLoading.value = false;
    isLoadingMore.value = false;
  }

  @override
  Future<void> onEndScroll() async {
    await nextPage();
  }

  @override
  Future<void> onTopScroll() async {}
}
