import 'dart:typed_data';

import 'package:admin_e_commerce/core/services/failure.dart';
import 'package:admin_e_commerce/features/add_ads/data/repos/add_ads_repo.dart';
import 'package:admin_e_commerce/features/add_ads/logic/cubit/add_ads_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  static AddAdsCubit get(context) => BlocProvider.of(context);
  final AddAdsRepo _addAdsRepo = AddAdsRepo();

  List<String> uploadedUrls = [];
  List<Uint8List> images = [];
  addAdds() async {
    emit(UploadAdsLoading());
    try {
      if (uploadedUrls.isEmpty) {
        emit(UploadAdsFailed('No images uploaded'));
      } else {
        await _addAdsRepo.uploadAdsImage(uploadedUrls);

        emit(UploadAdsSuccess());
      }
    } on Failure catch (e) {
      emit(UploadAdsFailed(e.toString()));
    }
  }

  pickImages() async {
    emit(ImageLoading(0));
    images = await _addAdsRepo.pickImages();
    if (images.isEmpty) {
      emit(ImageUploadFailed('No images selected'));
    } else {
      try {
        if (images.isNotEmpty) {
          uploadedUrls =
              await _addAdsRepo.uploadImages(images, (double progress) {
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
