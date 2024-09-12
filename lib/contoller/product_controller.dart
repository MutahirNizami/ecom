import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:newappui_8/model/Apimodel.dart';

class ProductController extends GetxController {
  var productList = <ApiModel>[].obs;
  var filteredProductList = <ApiModel>[].obs;
  var categoryList = <String>[].obs;
  var selectedCategoryIndex = 0.obs;
  RxList wishList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

  Future<void> getProductList() async {
    try {
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        productList
            .addAll(List<ApiModel>.from(data.map((e) => ApiModel.fromJson(e))));

        log("Product List ${productList.length}");

        if (productList.isNotEmpty) {
          for (var product in productList) {
            if (!categoryList.contains(product.category)) {
              categoryList.add(product.category);
            }
          }
        }
        categoryList.insert(0, "All");
        filterProducts("All");
      } else {
        log("Data is not present");
      }
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  void filterProducts(String category) {
    filteredProductList.clear();
    if (category == "All") {
      filteredProductList.addAll(productList);
    } else {
      filteredProductList
          .addAll(productList.where((product) => product.category == category));
    }
  }
}
