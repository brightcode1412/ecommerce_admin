import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/theming/app_style.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_text_form_field_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

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
  final _productweigthController = TextEditingController();
  // final _productRatingController = TextEditingController();
  final _productQuantityController = TextEditingController();
  // final _productIsBestSellerController = TextEditingController();
  // final _productPurchaseCountController = TextEditingController();
  // final _productProductIdController = TextEditingController();
  // final _productCategoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //  var height = MediaQuery.of(context).size.height;
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = context.read<DashBoardCubit>();
        return Form(
          key: _formKey,
          child: Container(
            width: width * 0.4,
            //   height: height * 0.7,
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
                          controller: _productweigthController,
                          labelText: 'Product Weight',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Is Offer :   ',
                        style: AppStyles.eduAUVICWANTHand700(context)
                            .copyWith(color: AppColor.blackColor, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
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
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Category :   ',
                        style: AppStyles.eduAUVICWANTHand700(context)
                            .copyWith(color: AppColor.blackColor, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
                                    ratingCount: 0,
                                    isOffer: _selectedIsOffer == 'true'
                                        ? true
                                        : false,

                                    imagesUrl: [],
                                    name: _productNameController.text.trim(),
                                    description: _productDescriptionController
                                        .text
                                        .trim(),
                                    price: _productPriceController.text.trim(),
                                    weight:
                                        _productweigthController.text.trim(),
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
    );
  }
}
