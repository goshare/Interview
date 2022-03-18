import 'package:flutter/material.dart';
import 'package:interview/Models/productModel.dart';
import 'package:interview/Screens/productDetail.dart';

class ProductListItem extends StatefulWidget {
  ProductModel? productModelObject;

  ProductListItem(this.productModelObject);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {

  static const imageBaeUrl = "https://mobile-tha-server.firebaseapp.com/";

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Container(
            child: Image.network(
              "$imageBaeUrl${widget.productModelObject?.productImage}",
              fit: BoxFit.cover,
            ),
            height: 100,
            width: 100,
          ),
          title: Text(widget.productModelObject?.productName ?? ""),
          subtitle:  Text(
              widget.productModelObject?.shortDescription ?? "",
              maxLines: 2,
            ),
           
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(ProductDetail.routeName,
                  arguments: widget.productModelObject);
            });
          });
   
  }
}
