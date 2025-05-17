import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';
import 'package:mundi_flutter_platform_client_app/app/models/user.dart';

part 'login_state.g.dart';

@match
enum LoginStateStatus { initial, loading, error, success }

class LoginState extends Equatable {
  final User? user;
  final LoginStateStatus status;
  final String? errorMessage;
  
  const LoginState({
    required this.user,
    required this.status,
    this.errorMessage,
  });

  const LoginState.initial()
      : status = LoginStateStatus.initial,
        user = null,
        errorMessage = null;

  @override
  List<Object?> get props => [
        user,
        status,
        errorMessage,
      ];

  LoginState copyWith({
    User? user,
    LoginStateStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
