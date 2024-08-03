import 'dart:typed_data';

abstract class DashBoardState {}

final class DashBoardInitial extends DashBoardState {}

final class DashBoardUploadProductLoading extends DashBoardState {}

final class DashBoardUploadProductSuccess extends DashBoardState {}

final class DashBoardUploadProductFailed extends DashBoardState {
  final String error;

  DashBoardUploadProductFailed({
    required this.error,
  });
}

class ImageState extends DashBoardState {
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
