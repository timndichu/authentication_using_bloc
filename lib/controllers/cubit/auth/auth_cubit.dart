import 'package:auth_bloc/controllers/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Repository repository;

  AuthCubit({this.repository}) : super(AuthInitial());

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
        emit(AuthLogin());
      }
    });
  }
}
