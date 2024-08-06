abstract class AddAdsState {}

final class AddAdsInitial extends AddAdsState {}

final class UploadAdsLoading extends AddAdsState {}

final class UploadAdsSuccess extends AddAdsState {}

final class UploadAdsFailed extends AddAdsState {
  final String message;

  UploadAdsFailed(this.message);
}

final class ImageLoading extends AddAdsInitial {
  final double uploadProgress;

  ImageLoading(this.uploadProgress);
}

final class ImageUploadSuccess extends AddAdsInitial {
  ImageUploadSuccess();
}

final class ImageUploadFailed extends AddAdsInitial {
  final String message;

  ImageUploadFailed(this.message);
}
