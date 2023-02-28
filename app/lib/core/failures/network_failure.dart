import 'failure.dart';

class NetworkFailure extends Failure {
  final int statusCode;

  NetworkFailure(
      {String message = 'Network failure', int code = 0, this.statusCode = 0})
      : super(message, code: code);
}
