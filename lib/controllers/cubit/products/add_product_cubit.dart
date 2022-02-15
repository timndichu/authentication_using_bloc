import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository.dart';
import 'products_cubit.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final Repository repository;
  final ProductCubit productsCubit;

  AddProductCubit({this.repository, this.productsCubit})
      : super(AddProductInitial());
  void addProduct(String message) {
    if (message.isEmpty) {
      emit(AddProductError(error: "todo message is empty"));
      return;
    }

    emit(AddingProduct());
    // Timer(Duration(seconds: 2), () {
    //   repository.addProduct(message).then((todo) {
    //     if (todo != null) {
    //       // productsCubit.addProduct(todo);
    //       emit(ProductAdded());
    //     }
    //   });
    // });
  }
}
