import 'package:awesome_app/photos/data/models/photo_src_model.dart';
import 'package:awesome_app/photos/domain/entities/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel({
    int id = 0,
    String? photographer,
    PhotoSrcModel src = const PhotoSrcModel(),
  }) : super(
          id: id,
          photographer: photographer,
          src: src,
        );

  factory PhotoModel.fromJson(json) {
    return PhotoModel(
      id: json['id'],
      photographer: json['photographer'],
      src: json['src'] != null
          ? PhotoSrcModel.fromJson(json['src'])
          : const PhotoSrcModel(),
    );
  }

  static List<PhotoModel> jsonToList(json) {
    if (json['photos'] != null) {
      return List<PhotoModel>.from(
          json['photos'].map((v) => PhotoModel.fromJson(v)));
    }

    return [];
  }
}
