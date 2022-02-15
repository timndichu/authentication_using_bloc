import 'package:auth_bloc/models/product.dart';

import 'network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  ///////////////////////////////////////////////////
  //PRODUCTS
  Future<List<Product>> fetchProducts() async {
    final todosRaw = await networkService.fetchProducts();
    return todosRaw.map((e) => Product.fromJson(e)).toList();
  }

  // Future<Product> addProduct(String message) async {
  //   final todoObj = {"todo": message, "isCompleted": "false"};

  //   final todoMap = await networkService.addProduct(todoObj);
  //   if (todoMap == null) return null;

  //   return Product.fromJson(todoMap);
  // }

  // Future<bool> deleteProduct(int id) async {
  //   return await networkService.deleteProduct(id);
  // }

  // Future<bool> updateProduct(String message, int id) async {
  //   final patchObj = {"todo": message};
  //   return await networkService.patchProduct(patchObj, id);
  // }
  ////////////////////////////////////////////////////////////////////

  //AUTHENTICATION
  //login
  Future<Map<String, dynamic>> postLogin(
      String username, String password) async {
    Map<String, String> userDetails = {
      "username": username,
      "password": password
    };

    return await networkService.postLogin(userDetails);
  }
}
