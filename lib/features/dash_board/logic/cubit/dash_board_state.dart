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

final class ChangeIndexState extends DashBoardState {
  ChangeIndexState();
}
