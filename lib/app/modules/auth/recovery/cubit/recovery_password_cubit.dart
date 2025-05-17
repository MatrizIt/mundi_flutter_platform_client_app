import 'package:bloc/bloc.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/connection_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/invalid_field_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/cubit/login_state.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/recovery/cubit/recovery_password_state.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class RecoveryPasswordCubit extends Cubit<RecoveryPasswordState> {
  final IAuthRepository authRepository;
  final LocalStorage localStorage;
  RecoveryPasswordCubit({
    required this.authRepository,
    required this.localStorage,
  }) : super(const RecoveryPasswordState.initial());

  Future<void> resetPassword(String email) async {
    try {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.loading,
        ),
      );

      await authRepository.resetPassword(email);

      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.resetPassword,
        ),
      );
    } on InvalidFieldException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Email inválidos",
        ),
      );
    } on ConnectionException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    }
  }

  Future<void> validateCode(String email, String code) async {
    try {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.loading,
        ),
      );

      await authRepository.validateCode(email, code);

      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.sendCode,
        ),
      );
    } on InvalidFieldException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Codigo inválido",
        ),
      );
    } on ConnectionException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    }
  }

  Future<void> newPassword(String email, String code, String newPassword) async {
    try {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.loading,
        ),
      );

      await authRepository.updatePassword(email, code, newPassword);

      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.newPassword,
        ),
      );
    } on InvalidFieldException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Email inválidos",
        ),
      );
    } on ConnectionException {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: RecoveryPasswordStateStatus.error,
          errorMessage: "Tente novamente, em alguns instantes",
        ),
      );
    }
  }

}
