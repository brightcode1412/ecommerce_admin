import 'package:admin_e_commerce/features/add_image/logic/cubit/image_web_cubit.dart';
import 'package:admin_e_commerce/features/home/logic/cubit/home_cubit.dart';
import 'package:admin_e_commerce/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String? _selectedCategory;
  final List<String> _categories = ['Electronics', 'Books', 'Clothing', 'Home'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload product')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ImageState) {
            final imageState = state;
            if (imageState.isLoading) {
              LinearPercentIndicator(
                lineHeight: 14.0,
                percent: (imageState.uploadProgress / 100).clamp(0.0, 1.0),
                center: Text('${imageState.uploadProgress}%'),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue,
              );
            }
            if (!imageState.isLoading && imageState.images.isEmpty) {
              ElevatedButton(
                onPressed: () => context.read<HomeCubit>().uploadImages(),
                child: const Text('Select Images'),
              );
            }
            return Row(
              children: [
                ...state.images.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Image.memory(
                            e.value,
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                                icon: const Icon(Icons.close), onPressed: () {}
                                // context.read<ImageCubit>().removeImage(e.key),
                                ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }
          return Column(
            children: [
              // Row(
              //   children: [
              //     ...state.images.asMap().entries.map((e) => Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Stack(
              //             children: [
              //               Image.memory(
              //                 e.value,
              //                 width: 100,
              //                 height: 100,
              //               ),
              //               Positioned(
              //                 right: 0,
              //                 top: 0,
              //                 child: IconButton(
              //                     icon: const Icon(Icons.close),
              //                     onPressed: () {}
              //                     // context.read<ImageCubit>().removeImage(e.key),
              //                     ),
              //               ),
              //             ],
              //           ),
              //         )),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),

              DropdownButton<String>(
                value: _selectedCategory,
                hint: const Text(
                  'Select Category',
                  style: TextStyle(color: Colors.black),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ],
          );
        },
      ),
    );
  }
}
