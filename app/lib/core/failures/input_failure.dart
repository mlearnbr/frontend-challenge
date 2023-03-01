import 'failure.dart';

class InputFailure extends Failure {
  InputFailure(
    String message, {
    int code = 0,
  }) : super(message, code: code);
}
