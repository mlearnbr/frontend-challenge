import '../../../core/failure/failure.dart';

abstract class HomeFailure extends Failure {
  const HomeFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class PeopleDatasourceFailure extends HomeFailure {
  const PeopleDatasourceFailure({
    String? message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
