import 'package:bloc/bloc.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/connection_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/invalid_field_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/cubit/login_state.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final IAuthRepository authRepository;
  final LocalStorage localStorage;
  LoginCubit({
    required this.authRepository,
    required this.localStorage,
  }) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(
        state.copyWith(
          status: LoginStateStatus.loading,
        ),
      );
      final accessToken = await authRepository.login(email, password);
      await localStorage.write("accessToken", accessToken);
      emit(
        state.copyWith(
          status: LoginStateStatus.success,
        ),
      );
    } on InvalidFieldException {
      emit(
        state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: "Email ou senha inválidos",
        ),
      );
    } on ConnectionException {
      emit(
        state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: "Erro ao efetuar Login",
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: "Erro ao efetuar Login",
        ),
      );
    }
  }
}
