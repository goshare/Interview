import 'package:flutter/material.dart';
import 'package:interview/Models/productModel.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = "ProductDetail";

  static const imageBaeUrl = "https://mobile-tha-server.firebaseapp.com/";

  @override
  Widget build(BuildContext context) {
    final productModelObject =
        ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "$imageBaeUrl${productModelObject.productImage}",
                fit: BoxFit.cover,
              ),
              Text(
                "Product Name: ${productModelObject.productName}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Description: ${productModelObject.longDescription}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                "Price: ${productModelObject.price}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
