import 'dart:async';

import 'package:auth_bloc/models/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  final Repository repository;

  ProductCubit({this.repository}) : super(ProductsInitial());

  void fetchProduct() {
    repository.fetchProducts().then((products) {
      emit(ProductsLoaded(products: products));
    });
  }

  void updateProductList() {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      emit(ProductsLoaded(products: currentState.products));
    }
  }

  addProduct(Product product) {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      final productList = currentState.products;
      productList.add(product);
      emit(ProductsLoaded(products: productList));
    }
  }

  void deleteProduct(Product product) {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      final productList = currentState.products
          .where((element) => element.id != product.id)
          .toList();
      emit(ProductsLoaded(products: productList));
    }
  }
}
