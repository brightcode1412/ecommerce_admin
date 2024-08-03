import 'package:admin_e_commerce/features/add_image/logic/cubit/image_web_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Images')),
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
