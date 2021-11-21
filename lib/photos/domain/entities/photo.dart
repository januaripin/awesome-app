import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  const Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.photographerId,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.avgColor,
    this.src = const PhotoSrc(),
    this.liked = false,
  });

  final int id;
  final int width;
  final int height;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final int photographerId;
  final String? avgColor;
  final PhotoSrc src;
  final bool liked;

  @override
  List<Object?> get props => [id];
}
