import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';

import '../../../../../models/schedule.dart';

part 'schedules_state.g.dart';

@match
enum ScheduleStatus { init, loading, success, error }

class ScheduleState extends Equatable {
  final ScheduleStatus status;
  final String? errorMessage;
  final List<Schedule>? schedules;
  final List<Schedule> scheduleFiltered;

  const ScheduleState(
      {required this.status,
      this.errorMessage,
      this.schedules,
      this.scheduleFiltered = const []});

  @override
  List<Object?> get props => [status, errorMessage, schedules];

  const ScheduleState.initial()
      : status = ScheduleStatus.init,
        schedules = null,
        scheduleFiltered = const [],
        errorMessage = null;

  ScheduleState copyWith(
      {ScheduleStatus? status,
      String? errorMessage,
      List<Schedule>? schedules,
      List<Schedule>? scheduleFiltered}) {
    return ScheduleState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        schedules: schedules ?? this.schedules,
        scheduleFiltered: scheduleFiltered ?? this.scheduleFiltered);
  }
}
