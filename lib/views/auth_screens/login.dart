// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth_bloc/controllers/cubit/auth/auth_cubit.dart';
import 'package:auth_bloc/models/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLogin) {
          Navigator.pushReplacementNamed(context, PRODUCTS_ROUTE);
        } else if (state is AuthError) {
          Toast.show(state.error, context,
              backgroundColor: Colors.red, duration: 3, gravity: Toast.CENTER);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _username,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your username' : null,
                        decoration: InputDecoration(
                            hintText: 'username', labelText: 'username'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _password,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your password' : null,
                        decoration: InputDecoration(
                            hintText: 'password', labelText: 'password'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .postLogin(_username.text, _password.text);
                          }
                        },
                        child: Text('Login'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
