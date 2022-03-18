import 'package:flutter/material.dart';
import 'package:interview/Models/productModel.dart';
import 'package:interview/Screens/productDetail.dart';

class ProductListItem extends StatelessWidget {
  ProductModel? productModelObject;

  ProductListItem(this.productModelObject);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          child: Image.network(
            "https://mobile-tha-server.firebaseapp.com/${productModelObject?.productImage}",
            fit: BoxFit.cover,
          ),
          height: 100,
          width: 100,
        ),
        title: Text(productModelObject?.productName ?? ""),
        subtitle: Container(
          child: Text(
            productModelObject?.shortDescription ?? "",
            overflow: TextOverflow.clip,
          ),
          height: 50,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetail.routeName,
              arguments: productModelObject);
        });
  }
}
