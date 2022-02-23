import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pm_app/models/productListModel.dart';
import 'package:pm_app/models/productModel.dart';
import 'package:http/http.dart' as http;

class ProductNotifier extends ChangeNotifier {
  ProductModel productModel = ProductModel(
    data: Data(
      id: 0,
      attributes: Attributes(
        title: '',
        price: 0,
        description: '',
        qty: '',
      ),
    ),
  );

  ProductListModel _productListModel = ProductListModel(
    data: [],
  );

  ProductModel get getProduct => productModel;
  ProductListModel get getProductList => _productListModel;

  Future<ProductModel> getProductModel() async {
    final url = Uri.parse("http://10.0.2.2:1337/api/products/1");

    try {
      final response = await http.get(url);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception("API Error");
      }
    } catch (e) {
      print(e.toString());
    }
    return productModel;
  }

  Future<void> getProductListModel() async {
    final url = Uri.parse("http://10.0.2.2:1337/api/multi-products");

    try {
      final response = await http.get(url);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        _productListModel =
            ProductListModel.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception("API Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setQuantity(int id, int qty) async {
    final url = Uri.parse("http://10.0.2.2:1337/api/multi-products/$id");
    qty++;

    try {
      final response = await http.put(
        url,
        // headers: {"Content-Type": "application/json"},
        body: {
          {
            "data": {"qty": qty.toString()}
          }
        },
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        getProductListModel();
        notifyListeners();
      } else {
        throw Exception("API Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
