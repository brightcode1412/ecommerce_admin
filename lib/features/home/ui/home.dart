import 'package:admin_e_commerce/features/add_image/logic/cubit/image_web_cubit.dart';
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
                  child: const Text('Select Images'),
                ),

              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: state.uploadedUrls.length,
              //   itemBuilder: (context, index) {
              //     return Image.network(
              //       state.uploadedUrls[index],
              //       width: 100,
              //       height: 100,
              //     );
              //   },
              // ),
              // drop down to select catogry name
              Row(
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
                                  icon: const Icon(Icons.close),
                                  onPressed: () {}
                                  // context.read<ImageCubit>().removeImage(e.key),
                                  ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
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
