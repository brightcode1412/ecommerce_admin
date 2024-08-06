import 'dart:typed_data';

import 'package:admin_e_commerce/core/services/failure.dart';
import 'package:admin_e_commerce/features/all_products/ui/display_all_products.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/data/repos/dash_board_repo.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());

  final HomeRepo _repository = HomeRepo();
  static DashBoardCubit get(context) => BlocProvider.of(context);
  List<String> uploadedUrls = [];
  List<Uint8List> images = [];
  int selectedIndex = 0;
  void uploadProduct(ProductModel productmodel) async {
    emit(DashBoardUploadProductLoading());
    try {
      if (uploadedUrls.isEmpty) {
        emit(DashBoardUploadProductFailed(error: 'No images uploaded'));
      } else {
        await _repository.uploadProduct(productmodel.copyWith(
          imagesUrl: uploadedUrls,
        ));

        emit(DashBoardUploadProductSuccess());
      }
    } on Failure catch (e) {
      emit(DashBoardUploadProductFailed(error: e.toString()));
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

  List<Widget> layouts = const [AddingProductBody(), DisplayAllProducts()];

  changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }
}
  // void uploadImages(List<Uint8List> images) async {
  //   emit(ImageLoading(0));
  //   try {
  //     uploadedUrls = await _repository.uploadImages(images, (int progress) {
  //       emit(ImageLoading(progress));
  //     });
  //     emit(ImageUploadSuccess(uploadedUrls));
  //   } catch (e) {
  //     emit(ImageUploadFailed(e.toString()));
  //   }
  // }
