import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(AuthApp(
    router: AppRouter(),
  ));
}

class AuthApp extends StatelessWidget {
  final AppRouter router;

  const AuthApp({Key key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
