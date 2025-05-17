import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';
import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';

part 'entrepreneur_state.g.dart';

@match
enum EntrepreneurStateStatus { initial, loading, error, loaded }

class EntrepreneurState extends Equatable {
  final EntrepreneurStateStatus status;
  final String? errorMessage;
  final Entrepreneur? entrepreneur;
  const EntrepreneurState({
    required this.status,
    this.errorMessage,
    this.entrepreneur,
  });

  const EntrepreneurState.initial()
      : status = EntrepreneurStateStatus.initial,
        entrepreneur = null,
        errorMessage = null;

  @override
  List<Object?> get props => [
        status,
        entrepreneur,
        errorMessage,
      ];

  EntrepreneurState copyWith({
    EntrepreneurStateStatus? status,
    String? errorMessage,
    Entrepreneur? entrepreneur,
  }) {
    return EntrepreneurState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      entrepreneur: entrepreneur ?? this.entrepreneur,
    );
  }
}
