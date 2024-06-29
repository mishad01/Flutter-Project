import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameTEContoller = TextEditingController();
  final TextEditingController _unitPriceTEContoller = TextEditingController();
  final TextEditingController _quantityTEContoller = TextEditingController();
  final TextEditingController _totalpriceTEContoller = TextEditingController();
  final TextEditingController _imageTEContoller = TextEditingController();
  final TextEditingController _productCodeTEContoller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewProductInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
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
              // if (_addNewProductInProgress == true)
              //   const Center(
              //     child: CircularProgressIndicator(),
              //   )
              // else
              Visibility(
                visible: _addNewProductInProgress == false,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addProduct();
                      }
                    },
                    child: Text('Add')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    const String addNewProductUrl =
        'https://crud.teamrabbil.com/api/v1/CreateProduct';

    Map<String, dynamic> inputData = {
      "Img": _imageTEContoller.text.trim(),
      "ProductCode": _productCodeTEContoller.text,
      "ProductName": _nameTEContoller.text,
      "Qty": _quantityTEContoller.text,
      "TotalPrice": _totalpriceTEContoller.text,
      "UnitPrice": _totalpriceTEContoller.text
    };

    Uri uri = Uri.parse(addNewProductUrl);
    Response response = await post(uri,
        body: jsonEncode(inputData),
        headers: {'content-type': 'application/json'});
    print(response.statusCode);
    print(response.body);
    print(response.headers);
    _addNewProductInProgress = false;
    setState(() {});

    if (response.statusCode == 200) {
      _nameTEContoller.clear();
      _imageTEContoller.clear();
      _totalpriceTEContoller.clear();
      _quantityTEContoller.clear();
      _unitPriceTEContoller.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('New Product Added')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('New Product Add Failed')));
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
