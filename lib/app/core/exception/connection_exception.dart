class ConnectionException implements Exception {
  final String? errorMessage;
  ConnectionException({
    this.errorMessage,
  });
}
