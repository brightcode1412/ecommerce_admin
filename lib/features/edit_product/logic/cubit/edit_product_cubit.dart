import 'package:admin_e_commerce/features/edit_product/data/edit_repo/edit_product_repo.dart';
import 'package:admin_e_commerce/features/edit_product/logic/cubit/edit_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit() : super(EditProductInitial());

  final EditProductRepo editProductRepo = EditProductRepo();

  void editProduct(String productId, Map<String, dynamic> updatedData) async {
    emit(EditProductLoading());
    try {
      await editProductRepo.editProduct(productId, updatedData);
      emit(EditProductSuccess());
    } catch (e) {
      emit(EditProductFailed(e.toString()));
    }
  }
}
