import 'package:awesome_app/photos/domain/entities/photo_src.dart';

class PhotoSrcModel extends PhotoSrc {
  const PhotoSrcModel({
    String original = '',
    String large2x = '',
    String large = '',
    String medium = '',
    String small = '',
    String portrait = '',
    String landscape = '',
    String tiny = '',
  }) : super(
    original: original,
    large2x: large2x,
    large: large,
    medium: medium,
    small: small,
    portrait: portrait,
    landscape: landscape,
    tiny: tiny,
  );

  factory PhotoSrcModel.fromJson(dynamic json) {
    return PhotoSrcModel(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }
}

