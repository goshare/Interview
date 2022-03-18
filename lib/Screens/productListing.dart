import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview/Helper/api.dart';
import 'package:interview/Helper/jsonParser.dart';
import 'package:interview/Models/productModel.dart';
import 'package:interview/Widgets/productListItem.dart';

class ProductListing extends StatefulWidget {
  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  List<ProductModel>? _proudctModelList;

  bool _isLoading = false;

  @override
  void initState() {
    hitAPI();
    super.initState();
  }

  Future<void> hitAPI() async {
    setState(() {
      _isLoading = true;
    });
    final apiClassObj = Api();
    Map? resultAPi = await apiClassObj.hitApi();
    setState(() {
      _isLoading = false;
      if (resultAPi == null) {
        return;
      }
      _proudctModelList = JsonParserHelper.convertJsonToObject(resultAPi);
      print(_proudctModelList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
      itemBuilder: (ctx, index) =>ProductListItem(_proudctModelList?[index]),
      itemCount: _proudctModelList?.length,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
