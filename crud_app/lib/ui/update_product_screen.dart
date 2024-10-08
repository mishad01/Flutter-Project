import 'package:crud_app/controller/update_product_controller.dart';
import 'package:crud_app/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UpdateProductController updateProductController =
      Get.find<UpdateProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: buildTextField(),
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Column(
      children: [
        TextFormField(
          controller: _nameTEController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              hintText: 'Product Name', labelText: 'Product Name'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your product name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _unitPriceTEController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: 'Unit Price', labelText: 'Unit Price'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your unit price';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _quantityTEController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: 'Quantity', labelText: 'Quantity'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your quantity';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _totalPriceTEController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: 'Total Price', labelText: 'Total Price'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your total price';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _productCodeTEController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: 'Product Code', labelText: 'Product Code'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your unit price';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _imageTEController,
          decoration:
              const InputDecoration(hintText: 'Image', labelText: 'Image'),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Write your image';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              editNewProductApiCall();
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        )
      ],
    );
  }

  Future<void> editNewProductApiCall() async {
    final bool result = await updateProductController.updateProduct(
      widget.product.sId,
      _nameTEController.text,
      int.parse(_productCodeTEController.text),
      _imageTEController.text,
      int.parse(_quantityTEController.text),
      int.parse(_unitPriceTEController.text),
      int.parse(_totalPriceTEController.text),
    );
    if (result == true) {
      Get.snackbar('Success', 'Product added successfully!');
    } else {
      Get.snackbar('Error', updateProductController.errorMessage);
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
