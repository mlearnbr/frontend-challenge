import 'failure.dart';

class InputFailure extends Failure {
  final String fieldName;

  InputFailure(String message, {int code = 0, required this.fieldName})
      : super(message, code: code);
}
