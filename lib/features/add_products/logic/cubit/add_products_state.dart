abstract class AddProductsState {}

final class AddProductInitial extends AddProductsState {}

final class UploadProductLoading extends AddProductsState {}

final class UploadProductSuccess extends AddProductsState {}

final class UploadProductFailed extends AddProductsState {
  final String error;

  UploadProductFailed({
    required this.error,
  });
}

final class ImageLoading extends AddProductsState {
  final double uploadProgress;

  ImageLoading(this.uploadProgress);
}

final class ImageUploadSuccess extends AddProductsState {
  ImageUploadSuccess();
}

final class ImageUploadFailed extends AddProductsState {
  final String message;

  ImageUploadFailed(this.message);
}

final class ChangeIndexState extends AddProductsState {
  ChangeIndexState();
}
