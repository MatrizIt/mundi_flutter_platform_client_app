// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension HomeStateStatusMatch on HomeStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() loaded}) {
    final v = this;
    if (v == HomeStateStatus.initial) {
      return initial();
    }

    if (v == HomeStateStatus.loading) {
      return loading();
    }

    if (v == HomeStateStatus.error) {
      return error();
    }

    if (v == HomeStateStatus.loaded) {
      return loaded();
    }

    throw Exception('HomeStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? loaded}) {
    final v = this;
    if (v == HomeStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == HomeStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == HomeStateStatus.error && error != null) {
      return error();
    }

    if (v == HomeStateStatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}

extension HomeScheduleStatusMatch on HomeScheduleStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() loaded}) {
    final v = this;
    if (v == HomeScheduleStatus.initial) {
      return initial();
    }

    if (v == HomeScheduleStatus.loading) {
      return loading();
    }

    if (v == HomeScheduleStatus.error) {
      return error();
    }

    if (v == HomeScheduleStatus.loaded) {
      return loaded();
    }

    throw Exception(
        'HomeScheduleStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? loaded}) {
    final v = this;
    if (v == HomeScheduleStatus.initial && initial != null) {
      return initial();
    }

    if (v == HomeScheduleStatus.loading && loading != null) {
      return loading();
    }

    if (v == HomeScheduleStatus.error && error != null) {
      return error();
    }

    if (v == HomeScheduleStatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}
