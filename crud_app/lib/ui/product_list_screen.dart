import 'package:crud_app/controller/delete_product_controller.dart';
import 'package:crud_app/controller/product_list_controller.dart';
import 'package:crud_app/data/model/product_model.dart';
import 'package:crud_app/ui/add_product_screen.dart';
import 'package:crud_app/ui/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListController productListController =
      Get.find<ProductListController>();
  DeleteProductController deleteProductController =
      Get.find<DeleteProductController>();

  @override
  void initState() {
    super.initState();
    // Fetch the product list when the screen is initialized
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: RefreshIndicator(
        onRefresh: getProduct,
        child: Visibility(
          visible: productListController.getProductListApiInProgress == false,
          replacement: Center(child: CircularProgressIndicator()),
          child: GetBuilder<ProductListController>(
            builder: (controller) {
              if (controller.getProductListApiInProgress) {
                // Show a loading indicator while fetching data
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.productList.isEmpty) {
                return const Center(child: Text('No products available.'));
              }

              return ListView.separated(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final product = controller.productList[index];
                  return _buildProductItem(product);
                },
                separatorBuilder: (_, __) => const Divider(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductItem(ProductModel product) {
    return ListTile(
      title: Text(product.productName.toString()), // Display the product name
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit Price: ${product.unitPrice}'),
          Text('Quantity: ${product.qty}'),
          Text('Total Price: ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UpdateProductScreen(product: product)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline_sharp),
            onPressed: () {
              _showDeleteConfirmationDialog(product);
              deleteProduct(product.sId!);
            },
          ),
        ],
      ),
    );
  }

  Future<void> getProduct() async {
    // Show a loading indicator while fetching data
    bool isSuccess = await productListController.getProductList();

    if (isSuccess) {
      // Handle success, e.g., updating UI, showing success message
      Get.snackbar('Success', 'Product list fetched successfully.',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      // Handle failure if needed
      Get.snackbar('Error', 'Failed to fetch product list.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> deleteProduct(String id) async {
    bool isSuccess = await deleteProductController.deleteProduct(id);
    if (isSuccess) {
      // Handle success, e.g., updating UI, showing success message
      Get.snackbar('Success', 'Product deleted successfully.',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      // Handle failure if needed
      Get.snackbar('Error', 'Failed to delete.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _showDeleteConfirmationDialog(ProductModel product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content:
              const Text('Are you sure that you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to delete the product
                Navigator.pop(context);
              },
              child: const Text('Yes, delete'),
            ),
          ],
        );
      },
    );
  }
}
