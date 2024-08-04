import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/adding_product_body.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_text_form_field_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBarWeb(
              title: 'Delish Delivery Admin',
            ),
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
        ),
      ),
    );
  }
}

class AddingProductBody extends StatefulWidget {
  const AddingProductBody({super.key});

  @override
  State<AddingProductBody> createState() => _AddingProductBodyState();
}

class _AddingProductBodyState extends State<AddingProductBody> {
  static final List<String> _categories = [
    'Vegetable',
    'Cooking Oil',
    'Meat & Fish',
    'Bakery & Snacks',
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
                          height: 55,
                          child: const Text('Add Product'),
                          onPressed: () {
                            ProductModel product = ProductModel(
                              isOffer:
                                  _selectedIsOffer == 'true' ? true : false,

                              imagesUrl: [],
                              name: _productNameController.text.trim(),
                              description:
                                  _productDescriptionController.text.trim(),
                              price: _productPriceController.text.trim(),
                              nutrition:
                                  _productNutritionController.text.trim(),
                              rating: 1.0,
                              quantity: _productQuantityController.text.trim(),
                              // isBestSeller: true,
                              purchaseCount: 1,
                              producttId: '',
                              categoryName: _selectedCategory,
                              // _productCategoryNameController.text.trim(),
                            );

                            if (_formKey.currentState!.validate()) {
                              cubit.uploadProduct(product);
                            }
                          }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
