import 'package:admin_e_commerce/features/add_products/data/model/product_model.dart';

abstract class DisplatAllProductsState {}

final class DisplatAllProductsInitial extends DisplatAllProductsState {}

final class DisplatAllProductsLoading extends DisplatAllProductsState {}

final class DisplatAllProductsLoaded extends DisplatAllProductsState {
  final List<ProductModel> products;
  DisplatAllProductsLoaded(this.products);
}

final class DisplatAllProductsError extends DisplatAllProductsState {
  final String error;
  DisplatAllProductsError(this.error);
}

final class DisplatAllProductsDeleting extends DisplatAllProductsState {}

final class DisplatAllProductsDeleted extends DisplatAllProductsState {}
