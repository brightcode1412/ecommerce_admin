// import 'package:app_image_web_test/add_image/data/repo.dart';
// import 'package:app_image_web_test/add_image/logic/cubit/image_web_cubit.dart';
// import 'package:app_image_web_test/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ImageCubit(ImageRepository()),
//         child: ImageUploadScreen(),
//       ),
//     );
//   }
// }

// class ImageUploadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Images')),
//       body: BlocBuilder<ImageCubit, ImageState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               if (!state.isLoading && state.images.isEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().selectFiles(),
//                   child: Text('Select Images'),
//                 ),
//               if (!state.isLoading && state.images.isNotEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().uploadFiles(),
//                   child: Text('Upload Images'),
//                 ),
//               if (state.isLoading) CircularProgressIndicator(),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.images.length,
//                   itemBuilder: (context, index) {
//                     return Image.memory(state.images[index]);
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:app_image_web_test/add_image/data/repo.dart';
// import 'package:app_image_web_test/add_image/logic/cubit/image_web_cubit.dart';
// import 'package:app_image_web_test/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ImageCubit(ImageRepository()),
//         child: ImageUploadScreen(),
//       ),
//     );
//   }
// }

// class ImageUploadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Images')),
//       body: BlocBuilder<ImageCubit, ImageState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               if (state.isLoading)
//                 CircularProgressIndicator(),
//               if (!state.isLoading && state.images.isEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().selectFiles(),
//                   child: Text('Select Images'),
//                 ),
//               if (!state.isLoading && state.images.isNotEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().uploadFiles(),
//                   child: Text('Upload Images'),
//                 ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.images.length,
//                   itemBuilder: (context, index) {
//                     return Image.memory(
//                       state.images[index],
//                       width: 100,
//                       height: 100,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }




// import 'package:app_image_web_test/add_image/data/repo.dart';
// import 'package:app_image_web_test/add_image/logic/cubit/image_web_cubit.dart';
// import 'package:app_image_web_test/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ImageCubit(ImageRepository()),
//         child: ImageUploadScreen(),
//       ),
//     );
//   }
// }

// class ImageUploadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Images')),
//       body: BlocBuilder<ImageCubit, ImageState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               if (state.isLoading)
//                 Text('${state.uploadProgress}%'),
//               if (!state.isLoading && state.images.isEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().selectFiles(),
//                   child: Text('Select Images'),
//                 ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.images.length,
//                   itemBuilder: (context, index) {
//                     return Image.memory(
//                       state.images[index],
//                       width: 100,
//                       height: 100,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:app_image_web_test/add_image/data/repo.dart';
// import 'package:app_image_web_test/add_image/logic/cubit/image_web_cubit.dart';
// import 'package:app_image_web_test/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => ImageCubit(ImageRepository()),
//         child: ImageUploadScreen(),
//       ),
//     );
//   }
// }

// class ImageUploadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Images')),
//       body: BlocBuilder<ImageCubit, ImageState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               if (state.isLoading)
//                 LinearPercentIndicator(
//                   lineHeight: 14.0,
//                   percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
//                   center: Text('${state.uploadProgress}%'),
//                   linearStrokeCap: LinearStrokeCap.roundAll,
//                   progressColor: Colors.blue,
//                 ),
//               if (!state.isLoading && state.images.isEmpty)
//                 ElevatedButton(
//                   onPressed: () => context.read<ImageCubit>().selectFiles(),
//                   child: Text('Select Images'),
//                 ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.images.length,
//                   itemBuilder: (context, index) {
//                     return Image.memory(
//                       state.images[index],
//                       width: 100,
//                       height: 100,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:admin_e_commerce/add_image/data/repo.dart';
import 'package:admin_e_commerce/add_image/logic/cubit/image_web_cubit.dart';
import 'package:admin_e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ImageCubit(ImageRepository()),
        child: ImageUploadScreen(),
      ),
    );
  }
}

class ImageUploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Images')),
      body: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.isLoading)
                LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
                  center: Text('${state.uploadProgress}%'),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.blue,
                ),
              if (!state.isLoading && state.images.isEmpty)
                ElevatedButton(
                  onPressed: () => context.read<ImageCubit>().selectFiles(),
                  child: Text('Select Images'),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.uploadedUrls.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      state.uploadedUrls[index],
                      width: 100,
                      height: 100,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}