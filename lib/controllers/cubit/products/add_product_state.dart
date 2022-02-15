part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductError extends AddProductState {
  final String error;

  AddProductError({this.error});
}

class AddingProduct extends AddProductState {}

class ProductAdded extends AddProductState {}
