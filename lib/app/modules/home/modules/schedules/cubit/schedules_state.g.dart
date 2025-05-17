// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ScheduleStatusMatch on ScheduleStatus {
  T match<T>(
      {required T Function() init,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == ScheduleStatus.init) {
      return init();
    }

    if (v == ScheduleStatus.loading) {
      return loading();
    }

    if (v == ScheduleStatus.success) {
      return success();
    }

    if (v == ScheduleStatus.error) {
      return error();
    }

    throw Exception('ScheduleStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? init,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == ScheduleStatus.init && init != null) {
      return init();
    }

    if (v == ScheduleStatus.loading && loading != null) {
      return loading();
    }

    if (v == ScheduleStatus.success && success != null) {
      return success();
    }

    if (v == ScheduleStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
