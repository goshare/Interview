import 'dart:convert';

import 'package:interview/Models/productModel.dart';

class JsonParserHelper {
  static List<ProductModel> convertJsonToObject(Map jsonResponse) {
    final arrayObject = jsonResponse['products'] as List;
    List<ProductModel> productListing = [];

    for (var e in arrayObject) {
      final item = ProductModel(e["productName"], e["shortDescription"],
          e["productImage"], e["longDescription"], e["price"]);
      productListing.add(item);
    }

    return productListing;
  }
}
