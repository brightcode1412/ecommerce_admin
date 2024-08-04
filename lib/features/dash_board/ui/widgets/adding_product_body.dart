import 'package:admin_e_commerce/core/theming/app_color.dart';
import 'package:admin_e_commerce/core/widgets/custom_app_button.dart';
import 'package:admin_e_commerce/features/dash_board/data/model/product_model.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_text_form_field_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingProductBody extends StatefulWidget {
  const AddingProductBody({super.key});

  @override
  State<AddingProductBody> createState() => _AddingProductBodyState();
}

class _AddingProductBodyState extends State<AddingProductBody> {
  static final List<String> _categories = [
    'Electronics',
    'Books',
    'Clothing',
    'Home'
  ];

  static final List<String> _booleanOptions = ['true', 'false'];

  String? _selectedCategory;
  String? _selectedIsOffer;
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productNutritionController = TextEditingController();
  final _productRatingController = TextEditingController();
  final _productQuantityController = TextEditingController();
  final _productIsBestSellerController = TextEditingController();
  final _productPurchaseCountController = TextEditingController();
  final _productProductIdController = TextEditingController();
  final _productCategoryNameController = TextEditingController();

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
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productDescriptionController,
                          labelText: 'Product Description',
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
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productNutritionController,
                          labelText: 'Product Nutrition',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productRatingController,
                          labelText: 'Product Rating',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productQuantityController,
                          labelText: 'Product Quantity',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productIsBestSellerController,
                          labelText: 'Is Best Seller',
                        ),
                      ),
                      const SizedBox(width: 20),
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
                              _selectedIsOffer = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productPurchaseCountController,
                          labelText: 'Purchase Count',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productProductIdController,
                          labelText: 'Product ID',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromFieldText(
                          controller: _productCategoryNameController,
                          labelText: 'Category Name',
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
                            });
                          },
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
                          height: 55,
                          child: const Text('Add Product'),
                          onPressed: () {
                            ProductModel product = ProductModel(
                              isOffer:
                                  _selectedIsOffer == 'true' ? true : false,

                              imagesUrl: [
                                'sadsadasd',
                                'sadsadasd',
                                'sadsadasd',
                              ],
                              name: _productNameController.text.trim(),
                              description:
                                  _productDescriptionController.text.trim(),
                              price: _productPriceController.text.trim(),
                              nutrition:
                                  _productNutritionController.text.trim(),
                              //  rating: _productRatingController.text.trim(),
                              quantity: _productQuantityController.text.trim(),
                              isBestSeller: true,
                              purchaseCount: 55,
                              producttId: '',
                              categoryName:
                                  _productCategoryNameController.text.trim(),
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

