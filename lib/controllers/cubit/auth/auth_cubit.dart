// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:auth_bloc/controllers/repository.dart';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with HydratedMixin {
  final Repository repository;

  AuthCubit({this.repository}) : super(AuthState(username: "", token: ""));

  void postLogin(String username, String password) {
    emit(AuthLoginLoading());
    repository.postLogin(username, password).then((result) {
      if (result["error"]) {
        emit(AuthError(
            error:
                "An error occurred. Please check your internet and try again"));
      } else if (result["body"] == "username or password is incorrect") {
        emit(AuthError(error: "Incorrect username or password"));
      } else {
        emit(AuthLoginComplete());
        emit(AuthState(username: username, token: result["body"]["token"]));
      }
    });
  }

  void postLogout() {
    emit(AuthState(username: "", token: ""));
    emit(AuthLogout());
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    return state.toMap();
  }
}
