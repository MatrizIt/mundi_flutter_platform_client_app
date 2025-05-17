import 'package:bloc/bloc.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/connection_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/invalid_field_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/user_already_exists.dart';
import 'package:mundi_flutter_platform_client_app/app/models/user.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/register/cubit/register_state.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IAuthRepository repository;
  RegisterCubit({
    required this.repository,
  }) : super(const RegisterState.initial());

  Future<void> register(User user) async {
    emit(
      state.copyWith(
        status: RegisterStateStatus.loading,
      ),
    );
    try {
      await repository.register(user);
      emit(
        state.copyWith(
          status: RegisterStateStatus.success,
        ),
      );
    } on UserAlreadyExists {
      emit(
        state.copyWith(
          status: RegisterStateStatus.error,
          errorMessage: "Usuário já cadastrado",
        ),
      );
    } on InvalidFieldException catch(e) {
      emit(
        state.copyWith(
          status: RegisterStateStatus.error,
          errorMessage: e.exception ?? 'Ops, Algo de inesperado aconteceu!',
        ),
      );
    } on ConnectionException {
      emit(
        state.copyWith(
          status: RegisterStateStatus.error,
          errorMessage: "Erro ao conectar-se ao servidor",
        ),
      );
    }
  }
}
