import 'dart:typed_data';
import 'package:admin_e_commerce/core/services/failure.dart';

import 'package:admin_e_commerce/features/add_products/data/model/product_model.dart';
import 'package:admin_e_commerce/features/add_products/data/repos/add_products_repo.dart';
import 'package:admin_e_commerce/features/add_products/logic/cubit/add_products_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit() : super(AddProductInitial());

  final AddProductRepo _repository = AddProductRepo();
  static AddProductsCubit get(context) => BlocProvider.of(context);
  List<String> uploadedUrls = [];
  List<Uint8List> images = [];

  void uploadProduct(ProductModel productmodel) async {
    emit(UploadProductLoading());
    try {
      if (uploadedUrls.isEmpty) {
        emit(UploadProductFailed(error: 'No images uploaded'));
      } else {
        await _repository.uploadProduct(productmodel.copyWith(
          imagesUrl: uploadedUrls,
        ));

        emit(UploadProductSuccess());
      }
    } on Failure catch (e) {
      emit(UploadProductFailed(error: e.toString()));
    }
  }

  pickImages() async {
    emit(ImageLoading(0));
    images = await _repository.pickImages();
    if (images.isEmpty) {
      emit(ImageUploadFailed('No images selected'));
    } else {
      try {
        if (images.isNotEmpty) {
          uploadedUrls =
              await _repository.uploadImages(images, (double progress) {
            Logger().d('Progress: $progress');
            emit(ImageLoading(progress));
          });

          emit(ImageUploadSuccess());
        }
      } on Failure catch (e) {
        emit(ImageUploadFailed(e.toString()));
      } catch (e) {
        emit(ImageUploadFailed(e.toString()));
      }
    }
  }


}
