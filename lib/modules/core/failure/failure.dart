class Failure implements Exception {
  final String? message;
  final StackTrace? stackTrace;

  const Failure({
    this.message,
    this.stackTrace,
  });
}
