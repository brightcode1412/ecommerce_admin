import 'dart:typed_data';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeUploadProductLoading extends HomeState {}

final class HomeUploadProductSuccess extends HomeState {}

final class HomeUploadProductFailed extends HomeState {
  final String error;

  HomeUploadProductFailed({
    required this.error,
  });
}

class ImageState extends HomeState {
  final bool isLoading;
  final List<Uint8List> images;
  final List<String> uploadedUrls;
  final int uploadProgress;

  ImageState({
    required this.isLoading,
    required this.images,
    required this.uploadedUrls,
    required this.uploadProgress,
  });
}
