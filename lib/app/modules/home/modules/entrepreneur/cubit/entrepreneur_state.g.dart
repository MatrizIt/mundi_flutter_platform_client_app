// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrepreneur_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension EntrepreneurStateStatusMatch on EntrepreneurStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() loaded}) {
    final v = this;
    if (v == EntrepreneurStateStatus.initial) {
      return initial();
    }

    if (v == EntrepreneurStateStatus.loading) {
      return loading();
    }

    if (v == EntrepreneurStateStatus.error) {
      return error();
    }

    if (v == EntrepreneurStateStatus.loaded) {
      return loaded();
    }

    throw Exception(
        'EntrepreneurStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? loaded}) {
    final v = this;
    if (v == EntrepreneurStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == EntrepreneurStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == EntrepreneurStateStatus.error && error != null) {
      return error();
    }

    if (v == EntrepreneurStateStatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}
