part of 'edit_product_cubit.dart';

@immutable
abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class EditProductError extends EditProductState {
  final String error;

  EditProductError({this.error});
}

class ProductEdited extends EditProductState {}
