import 'package:auth_bloc/models/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository.dart';
import 'products_cubit.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  final Repository repository;
  final ProductCubit productsCubit;

  EditProductCubit({this.repository, this.productsCubit})
      : super(EditProductInitial());

  // void deleteProduct(Product product) {
  //   repository.deleteProduct(product.id).then((isDeleted) {
  //     if (isDeleted) {
  //       // productsCubit.deleteProduct(product);
  //       emit(ProductEdited());
  //     }
  //   });
  // }

  // void updateProduct(Product product, String message) {
  //   print(message);
  //   if (message.isEmpty) {
  //     emit(EditProductError(error: "Message is empty"));
  //     return;
  //   }

  //   repository.updateProduct(message, product.id).then((isEdited) {
  //     if (isEdited) {
  //       // product.productMessage = message;
  //       // // productsCubit.updateProductList();
  //       // emit(ProductEdited());
  //     }
  //   });
  // }
}
