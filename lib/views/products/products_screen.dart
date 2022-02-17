// ignore_for_file: prefer_const_constructors

import 'package:auth_bloc/controllers/cubit/auth/auth_cubit.dart';
import 'package:auth_bloc/controllers/cubit/products/products_cubit.dart';
import 'package:auth_bloc/models/constants/strings.dart';
import 'package:auth_bloc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).fetchProduct();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLogout) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            actions: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.add),
                ),
              ),
              InkWell(
                onTap: () => {BlocProvider.of<AuthCubit>(context).postLogout()},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.logout),
                ),
              )
            ],
          ),
          body: BlocBuilder<ProductCubit, ProductsState>(
            builder: (context, state) {
              if (state is! ProductsLoaded) {
                return const Center(child: CircularProgressIndicator());
              }

              final products = (state as ProductsLoaded).products;

              return SingleChildScrollView(
                child: Column(
                  children: products.map((e) => _product(e, context)).toList(),
                ),
              );
            },
          )),
    );
  }

  Widget _product(Product product, context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, EDIT_TODO_ROUTE, arguments: product),
      child: Dismissible(
        key: Key("${product.id}"),
        child: _productTile(product, context),
        confirmDismiss: (_) async {
          // BlocProvider.of<ProductCubit>(context).changeCompletion(product);
          return false;
        },
        background: Container(
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _productTile(Product product, context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
        ),
        child: ListTile(
          title: Text(product.title),
        ));
  }
}
