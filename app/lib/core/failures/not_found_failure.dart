import 'failure.dart';

class NotFoundFailure extends Failure {
  final int statusCode;

  NotFoundFailure(
      {String message = 'Not Found failure', int code = 0, this.statusCode = 0})
      : super(message, code: code);
}
