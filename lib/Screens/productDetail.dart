import 'package:flutter/material.dart';
import 'package:interview/Models/productModel.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = "ProductDetail";

  // ProductDetail(this.productModelObject);

  @override
  Widget build(BuildContext context) {
    final productModelObject =
        ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://mobile-tha-server.firebaseapp.com/${productModelObject.productImage}",
                fit: BoxFit.cover,
              ),
              Text(
                productModelObject.productName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(productModelObject.longDescription),
              Text(productModelObject.price,style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
