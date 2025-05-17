import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';
import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';

import '../../../models/chats.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, error, loaded }

@match
enum HomeScheduleStatus { initial, loading, error, loaded }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final String? errorMessage;
  final List<Entrepreneur>? entrepreneurs;
  final List<Chat>? chats;
  final List<Entrepreneur>? filteredEntrepreneurs;
  final List<Entrepreneur>? filteredCategoryEntrepreneurs;

  const HomeState(
      {required this.status,
      this.entrepreneurs,
      this.errorMessage,
      this.chats,
      this.filteredEntrepreneurs,
      this.filteredCategoryEntrepreneurs});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        entrepreneurs = null,
        chats = null,
        errorMessage = null,
        filteredEntrepreneurs = null,
        filteredCategoryEntrepreneurs = null;

  @override
  List<Object?> get props => [
        status,
        entrepreneurs,
        errorMessage,
        chats,
        filteredEntrepreneurs,
        filteredCategoryEntrepreneurs
      ];

  HomeState copyWith(
      {List<Chat>? chats,
      HomeStateStatus? status,
      HomeScheduleStatus? statusSchedule,
      String? errorMessage,
      List<Entrepreneur>? entrepreneurs,
      List<Entrepreneur>? filteredEntrepreneurs,
      List<Entrepreneur>? filteredCategoryEntrepreneurs}) {
    return HomeState(
        status: status ?? this.status,
        entrepreneurs: entrepreneurs ?? this.entrepreneurs,
        errorMessage: errorMessage ?? this.errorMessage,
        chats: chats ?? this.chats,
        filteredEntrepreneurs:
            filteredEntrepreneurs ?? this.filteredEntrepreneurs,
        filteredCategoryEntrepreneurs: filteredCategoryEntrepreneurs ??
            this.filteredCategoryEntrepreneurs);
  }
}
