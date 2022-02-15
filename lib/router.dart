// ignore_for_file: prefer_const_constructors

import 'package:auth_bloc/controllers/cubit/auth/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/cubit/products/add_product_cubit.dart';
import 'controllers/cubit/products/edit_product_cubit.dart';
import 'controllers/cubit/products/products_cubit.dart';
import 'controllers/network_service.dart';
import 'controllers/repository.dart';
import 'models/constants/strings.dart';
import 'models/product.dart';
import 'views/products/add_product_screen.dart';
import 'views/products/products_screen.dart';
import 'views/auth_screens/login.dart';

class AppRouter {
  Repository repository;
  ProductCubit todosCubit;
  AuthCubit authCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    todosCubit = ProductCubit(repository: repository);
    authCubit = AuthCubit(repository: repository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: LoginPage(),
          ),
        );
      case "/products":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit,
            child: const ProductsScreen(),
          ),
        );
      case EDIT_TODO_ROUTE:
        final todo = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => EditProductCubit(
                    repository: repository,
                    productsCubit: todosCubit,
                  ),
              child: Container()),
        );
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AddProductCubit(
              repository: repository,
              productsCubit: todosCubit,
            ),
            child: AddProductScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
