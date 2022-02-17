import 'package:auth_bloc/controllers/cubit/auth/auth_cubit.dart';
import 'package:auth_bloc/controllers/cubit/products/products_cubit.dart';
import 'package:auth_bloc/controllers/network_service.dart';
import 'package:auth_bloc/controllers/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(AuthApp(
      router: AppRouter(),
      repository: Repository(networkService: NetworkService()),
    )),
    storage: storage,
  );
}

class AuthApp extends StatelessWidget {
  final AppRouter router;
  final Repository repository;
  const AuthApp({Key key, this.router, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(repository: repository),
        ),
        BlocProvider(
          create: (context) => ProductCubit(repository: repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
