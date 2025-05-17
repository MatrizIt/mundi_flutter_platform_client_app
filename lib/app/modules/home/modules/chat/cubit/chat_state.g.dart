// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ChatStatusMatch on ChatStatus {
  T match<T>(
      {required T Function() init,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == ChatStatus.init) {
      return init();
    }

    if (v == ChatStatus.success) {
      return success();
    }

    if (v == ChatStatus.error) {
      return error();
    }

    throw Exception('ChatStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? init,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == ChatStatus.init && init != null) {
      return init();
    }

    if (v == ChatStatus.success && success != null) {
      return success();
    }

    if (v == ChatStatus.error && error != null) {
      return error();
    }

    return any();
  }
}

extension MessageStatusMatch on MessageStatus {
  T match<T>(
      {required T Function() init,
      required T Function() sending,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == MessageStatus.init) {
      return init();
    }

    if (v == MessageStatus.sending) {
      return sending();
    }

    if (v == MessageStatus.success) {
      return success();
    }

    if (v == MessageStatus.error) {
      return error();
    }

    throw Exception('MessageStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? init,
      T Function()? sending,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == MessageStatus.init && init != null) {
      return init();
    }

    if (v == MessageStatus.sending && sending != null) {
      return sending();
    }

    if (v == MessageStatus.success && success != null) {
      return success();
    }

    if (v == MessageStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
