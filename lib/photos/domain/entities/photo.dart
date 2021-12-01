import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  const Photo({
    this.id = 0,
    this.photographer,
    this.src = const PhotoSrc(),
  });

  final int id;
  final String? photographer;
  final PhotoSrc src;

  @override
  List<Object?> get props => [id];
}
