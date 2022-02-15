import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "https://fakestoreapi.com";

  //PRODUCTS

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/products"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Future<bool> patchProduct(Map<String, String> patchObj, int id) async {
  //   try {
  //     await patch(Uri.parse(baseUrl + "/todos/$id"), body: patchObj);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<Map> addProduct(Map<String, String> todoObj) async {
  //   try {
  //     final response = await post(Uri.parse(baseUrl + "/todos"), body: todoObj);
  //     return jsonDecode(response.body);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future<bool> deleteProduct(int id) async {
  //   try {
  //     await delete(Uri.parse(baseUrl + "/todos/$id"));
  //     return true;
  //   } catch (er) {
  //     return false;
  //   }
  // }

  //AUTHENTICATION

  //LOGIN
  Future<Map<String, dynamic>> postLogin(
      Map<String, String> userDetails) async {
    try {
      final response =
          await post(Uri.parse(baseUrl + "/auth/login"), body: userDetails);
      print(response.body);
      return {"body": response.body, "error": false};
    } catch (e) {
      return {"error": true};
    }
  }
}
