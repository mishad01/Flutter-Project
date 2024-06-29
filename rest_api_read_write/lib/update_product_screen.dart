import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api_read_write/product_list_screen.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEContoller = TextEditingController();
  final TextEditingController _unitPriceTEContoller = TextEditingController();
  final TextEditingController _quantityTEContoller = TextEditingController();
  final TextEditingController _totalpriceTEContoller = TextEditingController();
  final TextEditingController _imageTEContoller = TextEditingController();
  final TextEditingController _productCodeTEContoller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _updateProductInProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEContoller.text = widget.product.productName;
    _unitPriceTEContoller.text = widget.product.unitPrice.toString();
    _quantityTEContoller.text = widget.product.quantity.toString();
    _totalpriceTEContoller.text = widget.product.totalPrice.toString();
    _imageTEContoller.text = widget.product.image.toString();
    _productCodeTEContoller.text = widget.product.productCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                //autovalidateMode: AutovalidateMode.always,
                controller: _nameTEContoller,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _productCodeTEContoller,
                decoration: InputDecoration(
                  hintText: 'Product Code',
                  labelText: 'Product Code',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _unitPriceTEContoller,
                decoration: InputDecoration(
                  hintText: 'Unit Price',
                  labelText: 'Unit Price',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _quantityTEContoller,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product Quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _totalpriceTEContoller,
                decoration: InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Total Price',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _imageTEContoller,
                decoration: InputDecoration(
                  hintText: 'Image',
                  labelText: 'Image',
                ),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Write your Product image';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _updateProduct();
                    }
                  },
                  child: Text('Update')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    _updateProductInProgress = true;
    setState(() {});

    Map<String, dynamic> inputData = {
      "Img": _imageTEContoller.text,
      "ProductCode": _productCodeTEContoller.text,
      "ProductName": _nameTEContoller.text,
      "Qty": _quantityTEContoller.text,
      "TotalPrice": _totalpriceTEContoller.text,
      "UnitPrice": _unitPriceTEContoller.text
    };

    String updateProductUrl =
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}';
    Uri uri = Uri.parse(updateProductUrl);
    Response response = await post(uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(inputData));

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Updated')));
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Update Failed')));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTEContoller.dispose();
    _imageTEContoller.dispose();
    _totalpriceTEContoller.dispose();
    _quantityTEContoller.dispose();
    _unitPriceTEContoller.dispose();
    super.dispose();
  }
}
