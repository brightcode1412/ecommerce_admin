abstract class EditProductState {}

final class EditProductInitial extends EditProductState {}

final class EditProductLoading extends EditProductState {}


final class EditProductSuccess extends EditProductState {}


final class EditProductFailed extends EditProductState {
  final String error;
  EditProductFailed(this.error);
}
