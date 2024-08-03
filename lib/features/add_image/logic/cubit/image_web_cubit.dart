// import 'dart:typed_data';
// import 'package:bloc/bloc.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:app_image_web_test/add_image/data/repo.dart';

// class ImageState {
//   final bool isLoading;
//   final List<Uint8List> images;
//   ImageState({required this.isLoading, required this.images});
// }

// class ImageCubit extends Cubit<ImageState> {
//   final ImageRepository repository;
//   ImageCubit(this.repository) : super(ImageState(isLoading: false, images: []));

//   void selectFiles() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
//     if (result != null) {
//       final images = result.files.map((file) => file.bytes!).toList();
//       emit(ImageState(isLoading: false, images: images));
//     }
//   }

//   void uploadFiles() async {
//     emit(ImageState(isLoading: true, images: state.images));
//     try {
//       await repository.uploadImages(state.images );
//     } catch (e) {
//       print('Error in uploadFiles: $e');
//     } finally {
//       emit(ImageState(isLoading: false, images: []));
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:bloc/bloc.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:app_image_web_test/add_image/data/repo.dart';

// class ImageState {
//   final bool isLoading;
//   final List<Uint8List> images;
//   final List<String> uploadedUrls;

//   ImageState({
//     required this.isLoading,
//     required this.images,
//     required this.uploadedUrls,
//   });
// }

// class ImageCubit extends Cubit<ImageState> {
//   final ImageRepository repository;

//   ImageCubit(this.repository)
//       : super(ImageState(isLoading: false, images: [], uploadedUrls: []));

//   void selectFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls));
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
//     if (result != null) {
//       final images = result.files.map((file) => file.bytes!).toList();
//       emit(ImageState(isLoading: false, images: images, uploadedUrls: state.uploadedUrls));
//     } else {
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls));
//     }
//   }

//   void uploadFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls));
//     try {
//       final uploadedUrls = await repository.uploadImages(state.images);
//       emit(ImageState(isLoading: false, images: [], uploadedUrls: uploadedUrls));
//     } catch (e) {
//       print('Error in uploadFiles: $e');
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls));
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:bloc/bloc.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:app_image_web_test/add_image/data/repo.dart';

// class ImageState {
//   final bool isLoading;
//   final List<Uint8List> images;
//   final List<String> uploadedUrls;
//   final int uploadProgress;

//   ImageState({
//     required this.isLoading,
//     required this.images,
//     required this.uploadedUrls,
//     required this.uploadProgress,
//   });
// }

// class ImageCubit extends Cubit<ImageState> {
//   final ImageRepository repository;

//   ImageCubit(this.repository)
//       : super(ImageState(isLoading: false, images: [], uploadedUrls: [], uploadProgress: 0));

//   void selectFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
//     if (result != null) {
//       final images = result.files.map((file) => file.bytes!).toList();
//       emit(ImageState(isLoading: false, images: images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//       uploadFiles();
//     } else {
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     }
//   }

//   void uploadFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     try {
//       final uploadedUrls = await repository.uploadImages(state.images, (progress) {
//         emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: progress));
//       });
//       emit(ImageState(isLoading: false, images: [], uploadedUrls: uploadedUrls, uploadProgress: 100));
//     } catch (e) {
//       print('Error in uploadFiles: $e');
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     }
//   }
// }

// import 'dart:typed_data';
// import 'package:bloc/bloc.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:app_image_web_test/add_image/data/repo.dart';

// class ImageState {
//   final bool isLoading;
//   final List<Uint8List> images;
//   final List<String> uploadedUrls;
//   final int uploadProgress;

//   ImageState({
//     required this.isLoading,
//     required this.images,
//     required this.uploadedUrls,
//     required this.uploadProgress,
//   });
// }

// class ImageCubit extends Cubit<ImageState> {
//   final ImageRepository repository;

//   ImageCubit(this.repository)
//       : super(ImageState(isLoading: false, images: [], uploadedUrls: [], uploadProgress: 0));

//   void selectFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true, withData: true);
//     if (result != null) {
//       final images = result.files.map((file) => file.bytes!).toList();
//       emit(ImageState(isLoading: false, images: images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//       uploadFiles();
//     } else {
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     }
//   }

//   void uploadFiles() async {
//     emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     try {
//       final uploadedUrls = await repository.uploadImages(state.images, (progress) {
//         emit(ImageState(isLoading: true, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: progress));
//       });
//       emit(ImageState(isLoading: false, images: [], uploadedUrls: uploadedUrls, uploadProgress: 100));
//     } catch (e) {
//       print('Error in uploadFiles: $e');
//       emit(ImageState(isLoading: false, images: state.images, uploadedUrls: state.uploadedUrls, uploadProgress: 0));
//     }
//   }
// }

import 'dart:typed_data';
import 'package:admin_e_commerce/features/add_image/data/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

class ImageState {
  final bool isLoading;
  final List<Uint8List> images;
  final List<String> uploadedUrls;
  final int uploadProgress;

  ImageState({
    required this.isLoading,
    required this.images,
    required this.uploadedUrls,
    required this.uploadProgress,
  });
}

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository repository;

  ImageCubit(this.repository)
      : super(ImageState(
            isLoading: false, images: [], uploadedUrls: [], uploadProgress: 0));

  void selectFiles() async {
    emit(ImageState(
        isLoading: true,
        images: state.images,
        uploadedUrls: state.uploadedUrls,
        uploadProgress: 0));
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, withData: true);
    if (result != null) {
      final images = result.files.map((file) => file.bytes!).toList();
      emit(ImageState(
          isLoading: false,
          images: images,
          uploadedUrls: state.uploadedUrls,
          uploadProgress: 0));
      uploadFiles();
    } else {
      emit(ImageState(
          isLoading: false,
          images: state.images,
          uploadedUrls: state.uploadedUrls,
          uploadProgress: 0));
    }
  }

  void uploadFiles() async {
    emit(ImageState(
        isLoading: true,
        images: state.images,
        uploadedUrls: state.uploadedUrls,
        uploadProgress: 0));
    try {
      final uploadedUrls =
          await repository.uploadImages(state.images, (progress) {
        print('Upload progress: $progress%');
        emit(ImageState(
            isLoading: true,
            images: state.images,
            uploadedUrls: state.uploadedUrls,
            uploadProgress: progress));
      });
      emit(ImageState(
          isLoading: false,
          images: [],
          uploadedUrls: uploadedUrls,
          uploadProgress: 100));
    } catch (e) {
      print('Error in uploadFiles: $e');
      emit(ImageState(
          isLoading: false,
          images: state.images,
          uploadedUrls: state.uploadedUrls,
          uploadProgress: 0));
    }
  }
}
