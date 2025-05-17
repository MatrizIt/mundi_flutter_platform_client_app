// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RecoveryPasswordStateStatusMatch on RecoveryPasswordStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() error,
      required T Function() success,
      required T Function() sendCode,
      required T Function() resetPassword,
      required T Function() newPassword}) {
    final v = this;
    if (v == RecoveryPasswordStateStatus.initial) {
      return initial();
    }

    if (v == RecoveryPasswordStateStatus.loading) {
      return loading();
    }

    if (v == RecoveryPasswordStateStatus.error) {
      return error();
    }

    if (v == RecoveryPasswordStateStatus.success) {
      return success();
    }

    if (v == RecoveryPasswordStateStatus.sendCode) {
      return sendCode();
    }

    if (v == RecoveryPasswordStateStatus.resetPassword) {
      return resetPassword();
    }

    if (v == RecoveryPasswordStateStatus.newPassword) {
      return newPassword();
    }

    throw Exception(
        'RecoveryPasswordStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? error,
      T Function()? success,
      T Function()? sendCode,
      T Function()? resetPassword,
      T Function()? newPassword}) {
    final v = this;
    if (v == RecoveryPasswordStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == RecoveryPasswordStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == RecoveryPasswordStateStatus.error && error != null) {
      return error();
    }

    if (v == RecoveryPasswordStateStatus.success && success != null) {
      return success();
    }

    if (v == RecoveryPasswordStateStatus.sendCode && sendCode != null) {
      return sendCode();
    }

    if (v == RecoveryPasswordStateStatus.resetPassword &&
        resetPassword != null) {
      return resetPassword();
    }

    if (v == RecoveryPasswordStateStatus.newPassword && newPassword != null) {
      return newPassword();
    }

    return any();
  }
}
