import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';
import 'package:mundi_flutter_platform_client_app/app/models/user.dart';

part 'recovery_password_state.g.dart';

@match
enum RecoveryPasswordStateStatus { initial, loading, error, success, sendCode, resetPassword, newPassword }

class RecoveryPasswordState extends Equatable {
  final RecoveryPasswordStateStatus status;
  final String? errorMessage;

  const RecoveryPasswordState({
    required this.status,
    this.errorMessage,
  });

  const RecoveryPasswordState.initial()
      : status = RecoveryPasswordStateStatus.initial,
        errorMessage = null;

  @override
  List<Object?> get props => [
    status,
    errorMessage,
  ];

  RecoveryPasswordState copyWith({
    User? user,
    RecoveryPasswordStateStatus? status,
    String? errorMessage,
  }) {
    return RecoveryPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
