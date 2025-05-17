import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';
import 'package:mundi_flutter_platform_client_app/app/models/user.dart';

part 'register_state.g.dart';

@match
enum RegisterStateStatus {
  initial,
  loading,
  error,
  success,
}

class RegisterState extends Equatable {
  final User? user;
  final RegisterStateStatus status;
  final String? errorMessage;
  const RegisterState({
    required this.user,
    required this.status,
    this.errorMessage,
  });

  const RegisterState.initial()
      : status = RegisterStateStatus.initial,
        user = null,
        errorMessage = null;

  @override
  List<Object?> get props => [
        user,
        status,
        errorMessage,
      ];

  RegisterState copyWith({
    User? user,
    RegisterStateStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
