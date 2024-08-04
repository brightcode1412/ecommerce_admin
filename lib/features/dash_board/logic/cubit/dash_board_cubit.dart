import 'dart:typed_data';

import 'package:admin_e_commerce/core/services/failure.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/data/repos/dash_board_repo.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());

  final HomeRepo _repository = HomeRepo();
  static DashBoardCubit get(context) => BlocProvider.of(context);
  List<String> uploadedUrls = [];
  List<Uint8List> images = [];

  void uploadProduct(ProductModel productmodel) async {
    emit(DashBoardUploadProductLoading());
    try {
      if (uploadedUrls.isNotEmpty) {
        //   emit(DashBoardUploadProductFailed(error: 'No images uploaded'));
        // } else {
        _repository.uploadProduct(productmodel.copyWith(
          imagesUrl: uploadedUrls,
        ));

        emit(DashBoardUploadProductSuccess());
      } else {
        emit(ImageUploadFailed('No images uploaded'));
      }
    } catch (e) {
      print('Error in uploadProduct: $e');
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
}
