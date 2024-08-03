import 'dart:typed_data';

import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/data/repos/dash_board_repo.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());

  final HomeRepo _repository = HomeRepo();

  List<String> uploadedUrls = [];

  void uploadProduct(ProductModel productmodel) async {
    emit(DashBoardUploadProductLoading());
    try {
      // if (uploadedUrls.isEmpty) {
      //   emit(DashBoardUploadProductFailed(error: 'No images uploaded'));
      // } else {
      _repository.uploadProduct(productmodel);

      emit(DashBoardUploadProductSuccess());
      //   }
    } catch (e) {
      print('Error in uploadProduct: $e');
      emit(DashBoardUploadProductFailed(error: e.toString()));
    }
  }

  void uploadImages() async {
    if (state is ImageState) {
      final imageState = state as ImageState;
      emit(ImageState(
        isLoading: true,
        images: imageState.images,
        uploadedUrls: imageState.uploadedUrls,
        uploadProgress: 0,
      ));

      // Pick files
      final result = await FilePicker.platform
          .pickFiles(allowMultiple: true, withData: true);
      if (result != null) {
        List<Uint8List> images =
            result.files.map((file) => file.bytes!).toList();
        emit(ImageState(
          isLoading: true,
          images: images,
          uploadedUrls: imageState.uploadedUrls,
          uploadProgress: 0,
        ));

        // Upload files
        try {
          uploadedUrls = await _repository.uploadImages(images, (progress) {
            emit(ImageState(
              isLoading: true,
              images: images,
              uploadedUrls: imageState.uploadedUrls,
              uploadProgress: progress,
            ));
          });
          emit(ImageState(
            isLoading: false,
            images: [],
            uploadedUrls: uploadedUrls,
            uploadProgress: 100,
          ));
        } catch (e) {
          emit(DashBoardUploadProductFailed(error: e.toString()));
        }
      } else {
        emit(DashBoardUploadProductFailed(error: 'No files selected'));
      }
    } else {
      // Handle the case where the state is not ImageState
      emit(DashBoardUploadProductFailed(error: 'Invalid state'));
    }
  }
}
