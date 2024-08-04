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

final class ImageLoading extends DashBoardState {
  final double uploadProgress;

  ImageLoading(this.uploadProgress);
}

final class ImageUploadSuccess extends DashBoardState {
  ImageUploadSuccess();
}

final class ImageUploadFailed extends DashBoardState {
  final String message;

  ImageUploadFailed(this.message);
}




// class ImageState extends DashBoardState {
//   final bool isLoading;
//   final List<Uint8List> images;
//   final List<String> uploadedUrls;
//   final int uploadProgress;

//   ImageState({
//     required this.isLoading,
//     required this.images,
//     required this.uploadedUrls,
//     required this.uploadProgress,
//   });
// }
