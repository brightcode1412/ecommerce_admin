
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';

abstract class DisplatAllProductsState {}

final class DisplatAllProductsInitial extends DisplatAllProductsState {}

final class DisplatAllProductsLoading extends DisplatAllProductsState {}


final class DisplatAllProductsLoaded extends DisplatAllProductsState {
  final List<ProductModel> products;

  DisplatAllProductsLoaded(this.products);
}


final class DisplatAllProductsError extends DisplatAllProductsState {
  final String message;

  DisplatAllProductsError(this.message);
}
