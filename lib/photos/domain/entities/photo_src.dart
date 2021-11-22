import 'package:equatable/equatable.dart';

class PhotoSrc extends Equatable {
  const PhotoSrc({
    this.original = '',
    this.large2x = '',
    this.large = '',
    this.medium = '',
    this.small = '',
    this.portrait = '',
    this.landscape = '',
    this.tiny = '',
  });

  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  @override
  List<Object?> get props => [];
}
