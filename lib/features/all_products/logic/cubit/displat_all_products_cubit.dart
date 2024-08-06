import 'package:admin_e_commerce/features/all_products/data/repos/display_all_products.dart';
import 'package:admin_e_commerce/features/all_products/logic/cubit/displat_all_products_state.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplatAllProductsCubit extends Cubit<DisplatAllProductsState> {
  DisplatAllProductsCubit() : super(DisplatAllProductsInitial());

  DisplayAllProductsRepo displayAllProductsRepo = DisplayAllProductsRepo();

  List<ProductModel> products = [];

  void getAllProducts() async {
    emit(DisplatAllProductsLoading());
    try {
      products = await displayAllProductsRepo.getAllProducts();
      emit(DisplatAllProductsLoaded(products));
    } catch (e) {
      emit(DisplatAllProductsError(e.toString()));
    }
  }

  void deleteProduct(String productId, List<String> imageUrls) async {
    emit(DisplatAllProductsDeleting());
    try {
      await displayAllProductsRepo.deleteProduct(productId, imageUrls);
      products.removeWhere((product) => product.producttId == productId);
      emit(DisplatAllProductsDeleted());
      emit(DisplatAllProductsLoaded(products));
    } catch (e) {
      emit(DisplatAllProductsError(e.toString()));
    }
  }
}