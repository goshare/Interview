import 'package:interview/Models/productModel.dart';
import 'package:html/parser.dart';

class JsonParserHelper {
  static List<ProductModel> convertJsonToObject(Map jsonResponse) {
    final arrayObject = jsonResponse['products'] as List;
    List<ProductModel> productListing = [];

    for (var e in arrayObject) {
      final convertedShortDescriptionString = convertHTMLTOString(e["shortDescription"]);
      final convertedLongDescriptionString = convertHTMLTOString(e["longDescription"]);
      final item = ProductModel(e["productName"], convertedShortDescriptionString,
          e["productImage"], convertedLongDescriptionString, e["price"]);
      productListing.add(item);
    }

    return productListing;
  }

  static convertHTMLTOString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement!.text;
    return parsedString;
  }
}
