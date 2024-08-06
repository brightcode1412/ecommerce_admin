import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBarWeb(
            title: 'Delish Delivery Admin',
          ),
          BlocBuilder<DashBoardCubit, DashBoardState>(
            builder: (context, state) {
              var cubit = DashBoardCubit.get(context);

              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    NavigationRail(
                      selectedIndex: cubit.selectedIndex,
                      onDestinationSelected: cubit.changeIndex,
                      labelType: NavigationRailLabelType.none,
                      // selectedIconTheme:
                      //     const IconThemeData(color: Colors.transparent),
                      // unselectedIconTheme:
                      //     const IconThemeData(color: Colors.transparent),
                      backgroundColor: Colors.transparent,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.add),
                          label: Text(''),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.edit),
                          label: Text('Another Option'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          BlocBuilder<DashBoardCubit, DashBoardState>(
            builder: (context, state) {
              var cubit = DashBoardCubit.get(context);
              if (cubit.selectedIndex == 0) {
                return const AddingProductBodyForm();
              } else {
                return const Center(
                  child: Text('data'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class AddingProductBody extends StatelessWidget {
  const AddingProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Add Product',
          style: AppStyles.eduAUVICWANTHand700(context).copyWith(
            color: AppColor.blackColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocConsumer<DashBoardCubit, DashBoardState>(
          listener: (context, state) {
            if (state is ImageUploadFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Image Upload Failed'),
                ),
              );
            }
          },
          builder: (context, state) {
            var cubit = DashBoardCubit.get(context);
            return state is ImageLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.green75Color,
                      value: (state).uploadProgress,
                    ),
                  )
                : state is ImageUploadSuccess ||
                        state is DashBoardUploadProductLoading
                    ? Center(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: cubit.images.map((image) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              foregroundImage: MemoryImage(image),
                            ),
                          );
                        }).toList(),
                      ))
// default ال
                    : CustomAppButton(
                        backgroundColor: state is ImageLoading
                            ? AppColor.grey64Color
                            : AppColor.green75Color,
                        width: MediaQuery.sizeOf(context).width * .1,
                        height: 36,
                        onPressed: state is ImageLoading
                            ? () {}
                            : () {
                                context.read<DashBoardCubit>().pickImages();
                              },
                        child: const Text('Upload Images'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const AddingProductBody(),
      ],
    );
  }
}

class AddingProductBodyForm extends StatefulWidget {
  const AddingProductBodyForm({super.key});

  @override
  State<AddingProductBodyForm> createState() => _AddingProductBodyFormState();
}

class _AddingProductBodyFormState extends State<AddingProductBodyForm> {
  static final List<String> _categories = [
    'Vegetable',
    'Cooking Oil',
    'Meat & Fish',
    'Bakery & Snacks',
    'Dairy & Eggs',
    'Beverages',
  ];

  static final List<String> _booleanOptions = ['true', 'false'];

  String? _selectedCategory = 'Vegetable';

  String _selectedIsOffer = 'false';

  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productNutritionController = TextEditingController();
  // final _productRatingController = TextEditingController();
  final _productQuantityController = TextEditingController();
  // final _productIsBestSellerController = TextEditingController();
  // final _productPurchaseCountController = TextEditingController();
  // final _productProductIdController = TextEditingController();
  // final _productCategoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = context.read<DashBoardCubit>();
        return Form(
          key: _formKey,
          child: Container(
            width: width * 0.4,
            height: height * 0.7,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.green75Color),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productNameController,
                          labelText: 'Product Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Product Name cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productDescriptionController,
                          labelText: 'Product Description',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Product Description cannot be empty';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productPriceController,
                          labelText: 'Product Price',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Product Price cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productNutritionController,
                          labelText: 'Product Nutrition',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Product Nutrition cannot be empty';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productQuantityController,
                          labelText: 'Product Quantity',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Product Quantity cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          hint: const Text('Select Category'),
                          items: _categories.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCategory = newValue;
                              Logger()
                                  .d('Selected Category: $_selectedCategory');
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Is Offer :   ',
                        style: AppStyles.eduAUVICWANTHand700(context)
                            .copyWith(color: AppColor.blackColor, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      DropdownButton<String>(
                        value: _selectedIsOffer,
                        hint: const Text('Is Offer'),
                        items: _booleanOptions.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedIsOffer = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  state is DashBoardUploadProductLoading
                      ? const CircularProgressIndicator()
                      : CustomAppButton(
                          borderRadius: 10,
                          width: double.infinity,
                          backgroundColor: state is ImageLoading
                              ? Colors.transparent
                              : AppColor.green75Color,
                          height: 55,
                          onPressed: state is ImageLoading
                              ? () {
                                  debugPrint(
                                      'Update cancelled, not proceeding.');
                                }
                              : () {
                                  ProductModel product = ProductModel(
                                    isOffer: _selectedIsOffer == 'true'
                                        ? true
                                        : false,

                                    imagesUrl: [],
                                    name: _productNameController.text.trim(),
                                    description: _productDescriptionController
                                        .text
                                        .trim(),
                                    price: _productPriceController.text.trim(),
                                    nutrition:
                                        _productNutritionController.text.trim(),
                                    rating: 1.0,
                                    quantity:
                                        _productQuantityController.text.trim(),
                                    // isBestSeller: true,
                                    purchaseCount: 1,
                                    producttId: '',
                                    categoryName: _selectedCategory,
                                    // _productCategoryNameController.text.trim(),
                                  );

                                  if (_formKey.currentState!.validate()) {
                                    cubit.uploadProduct(product);
                                  }
                                },
                          child: const Text('Add Product')),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: items.length,
    );
  }
}

class AddProductLayout extends StatelessWidget {
  const AddProductLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<DashBoardCubit, DashBoardState>(
          listener: (context, state) {
            if (state is ImageUploadFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Image Upload Failed'),
                ),
              );
            }
          },
          builder: (context, state) {
            var cubit = DashBoardCubit.get(context);
            return state is ImageLoading
                ? CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 13.0,
                    percent: (state.uploadProgress / 100).clamp(0.0, 1.0),
                    center: Text('${state.uploadProgress.toInt()}%'),
                    progressColor: AppColor.green75Color,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 1200,
                  )
                : state is ImageUploadSuccess ||
                        state is DashBoardUploadProductLoading
                    ? Center(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: cubit.images.map((image) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              foregroundImage: MemoryImage(image),
                            ),
                          );
                        }).toList(),
                      ))
                    // default ال

                    : CustomAppButton(
                        borderRadius: 10,
                        backgroundColor: state is ImageLoading
                            ? AppColor.grey64Color
                            : AppColor.green75Color,
                        width: MediaQuery.sizeOf(context).width * .1,
                        height: 36,
                        onPressed: state is ImageLoading
                            ? () {}
                            : () {
                                context.read<DashBoardCubit>().pickImages();
                              },
                        child: const Text('Upload Images'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const AddingProductBody(),
      ],
    );
  }
}

class SelectionItem extends StatelessWidget {
  const SelectionItem({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColor.green75Color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        item,
        style: AppStyles.eduAUVICWANTHand700(context).copyWith(
          color: AppColor.whiteColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
