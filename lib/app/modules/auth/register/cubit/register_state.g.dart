// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RegisterStateStatusMatch on RegisterStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() success}) {
    final v = this;
    if (v == RegisterStateStatus.initial) {
      return initial();
    }

    if (v == RegisterStateStatus.loading) {
      return loading();
    }

    if (v == RegisterStateStatus.error) {
      return error();
    }

    if (v == RegisterStateStatus.success) {
      return success();
    }

    throw Exception(
        'RegisterStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? success}) {
    final v = this;
    if (v == RegisterStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == RegisterStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == RegisterStateStatus.error && error != null) {
      return error();
    }

    if (v == RegisterStateStatus.success && success != null) {
      return success();
    }

    return any();
  }
}
